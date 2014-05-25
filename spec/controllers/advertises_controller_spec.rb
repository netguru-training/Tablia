require 'spec_helper'

describe AdvertisesController do
  let!(:user) { create(:user) }
  let!(:advertise_one) { create(:advertise, user: user) }
  let!(:advertise_two) { create(:advertise, user: user) }

  context 'for signed in user' do
    before do
      request.env['warden'].stub authenticate!: user
      controller.stub current_user: user
    end

    describe 'POST create' do
      let!(:temporary_advertise) { FactoryGirl.build(:advertise, user: user) }
      
      it 'should create new advertise for current user' do
        expect { post :create, advertise: temporary_advertise.attributes }.to change(user.advertises, :count).by(1)
      end
    end

    describe 'PATCH update' do
      before { advertise_one.title = 'Changed title' }

      it 'should change title of advertise' do
        patch :update, id: advertise_one.id, advertise: advertise_one.attributes
        expect(controller.advertise.title).to eq('Changed title')
      end
    end

    describe 'DELETE destroy' do
      let!(:other_user) { create(:user) }
      let!(:other_user_advertise) { create(:advertise, user: other_user) }

      it 'is possible only for your own advertise' do
        expect { delete :destroy, id: advertise_one.id }.to change(Advertise, :count).by(-1)
      end

      it 'is not possible for other advertises' do
        expect { delete :destroy, id: other_user_advertise.id }.to_not change(Advertise, :count)
      end
    end
  end

  context 'for unsigned user' do
    describe 'GET new' do
      it 'redirects to sign_in' do
        get :new
        controller.should redirect_to(new_user_session_path)
      end
    end

    # is there any need to test other actions if they use same before_action?
  end

  context 'for both signed in and unsigned' do
    describe 'GET index' do
      it "exposes all advertises from all users" do
        get :index
        expect(controller.advertises.count).to eq(2)
      end
    end

    describe 'GET show' do
      it "exposes exact advertise" do
        get :show, id: advertise_one.id
        expect(controller.advertise).to eq(advertise_one)
      end
    end
  end
end
