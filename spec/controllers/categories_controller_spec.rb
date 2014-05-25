require 'spec_helper'

describe CategoriesController do
  let!(:user) { create(:user) }
  let!(:category_one) { create(:category) }
  let!(:category_two) { create(:category) }

  let!(:advertise_one) { create(:advertise, user: user, category: category_one) }
  let!(:advertise_two) { create(:advertise, user: user, category: category_two) }
end
