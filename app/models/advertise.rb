class Advertise
  include Mongoid::Document
  include Mongoid::Timestamps

  mount_uploader :product, ProductUploader

  field :title, type: String
  field :body, type: String

  belongs_to  :user
  belongs_to  :category

  index({ user: 1 }, { unique: true, name: "user_index" })
  index({ title: 1 }, { unique: false, name: "title_index" })
  index({ body: 1 }, {unique: true, name: "body_index" })
  index({ created_at: 1 }, { unique: false, name: "created_at" })

  #scope :recent -> {
  #  where(created_at: 3.days.ago..Time.now)
  #}

  #scope :by_user, -> (user_name) {
  #  joins(:users).where(user: { name: user_name })
  #}

  #scope :by_title, -> (title) {
  #  where(title: title)
  #}

  #scope :by_phrase, -> (text) {
  #  where(body: /%{text}/)
  # }

end
