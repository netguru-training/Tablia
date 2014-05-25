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
