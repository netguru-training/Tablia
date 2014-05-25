class Category
  include Mongoid::Document
  include Mongoid::Timestamps

  validates_presence_of :name

  ALLOWED_CLASSES = ['fa fa-car', 'fa fa-child', 'fa fa-paw',
              'fa fa-paper-plane', 'fa fa-flask', 'fa fa-space-shuttle',
              'fa fa-camera', 'fa fa-cogs', 'fa fa-desktop',
              'fa fa-female', 'fa fa-glass', 'fa fa-heart']

  field :name, type: String
  field :icon_class, type: String, default: 'default'

  has_many :advertises

  validates :icon_class, :inclusion => { :in => ALLOWED_CLASSES }
end
