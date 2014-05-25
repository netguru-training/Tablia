require 'spec_helper'

describe CategoriesController do
  let!(:user) { create(:user) }
  let!(:category_one) { create(:category) }
  let!(:category_two) { create(:category) }

  let!(:advertise_one) { create(:advertise, user: user, category: category_one) }
  let!(:advertise_two) { create(:advertise, user: user, category: category_two) }

  context 'for signed in users' do
    before do
      request.env['warden'].stub authenticate!: user
      controller.stub current_user: user
    end

    describe 'POST create' do
      let!(:temporary_category) { FactoryGirl.build(:category) }
      
      it 'should create new category' do
        expect { post :create, category: temporary_category.attributes }.to change(Category, :count).by(1)
      end
    end

    describe 'PATCH update' do
      before { category_one.name = 'Changed title' }

      it 'should change title of category' do
        patch :update, id: category_one.id, category: category_one.attributes
        expect(controller.category.name).to eq('Changed title')
      end
    end
  end

  context 'for unsigned users' do
    describe 'GET new' do
      it 'redirects to sign_in' do
        get :new
        controller.should redirect_to(new_user_session_path)
      end
    end
  end

  context 'for both signed and unsigned users' do
    describe 'GET index' do
      it "exposes all categories" do
        get :index
        expect(controller.categories.count).to eq(2)
      end
    end

    describe 'GET show' do
      it "exposes exact category" do
        get :show, id: category_one.id
        expect(controller.category).to eq(category_one)
      end
    end
  end
end
