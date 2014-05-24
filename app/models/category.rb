class Category
  include Mongoid::Document
  include Mongoid::Timestamps

  validates_presence_of :name

  field :name, type: String

  has_many :advertises
end