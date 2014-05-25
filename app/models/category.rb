class Category
  include Mongoid::Document
  include Mongoid::Timestamps

  validates_presence_of :name

  ALLOWED_CLASSES = %w(fa-car fa-2 fa-child fa-2 fa-paw fa-2
              fa-paper-plane fa-2 fa-image-ao fa-2 fa-space-shuttle fa-2
              fa-camera fa-2 fa-cogs fa-2 fa-desktop fa-2
              fa-female fa-2 fa-glass fa-2 fa-heart fa-2)

  field :name, type: String
  field :icon_class, type: String, default: 'default'

  has_many :advertises

  validates :icon_class, :inclusion => { :in => ALLOWED_CLASSES }
end
