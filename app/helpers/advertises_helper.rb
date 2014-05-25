module AdvertisesHelper
  def owner_of_the_advertise?
    current_user == advertise.user
  end

  def categories_list
    Category.all.map {|c| [c.name, c.id]}
  end
end
