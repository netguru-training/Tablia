module AdvertisesHelper
  def owner_of_the_advertise?
    current_user == advertise.user
  end
end
