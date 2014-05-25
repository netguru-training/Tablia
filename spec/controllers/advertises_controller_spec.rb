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

  end

  context 'for both' do
    describe 'GET index' do
      it "exposes all advertises from all users" do
        get :index
        controller.advertises.count eq 2
      end
    end
  end
end
