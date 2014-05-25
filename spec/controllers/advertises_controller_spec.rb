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

    
  end

  context 'for unsigned user' do
    describe 'GET new' do
      it 'redirects to sign_in' do
        get :new
        controller.should redirect_to(new_user_session_path)
      end
    end
  end

  context 'for both' do
    describe 'GET index' do
      it "exposes all advertises from all users" do
        get :index
        controller.advertises.count eq 2
      end
    end

    describe 'GET show' do
      it "exposes exact advertise" do
        get :show, id: advertise_one.id
        controller.advertise.should eq advertise_one
      end
    end
  end
end
