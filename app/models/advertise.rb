class Advertise
  include Mongoid::Document
  include Mongoid::Timestamps

  field :title, type: String
  field :body, type: String

  belongs_to  :user

  index({user: 1}, { unique: true, name: "user_index" }
  index({created_at: 1}, { unique: false, name: "created_at" }

  scope :recent,(mojazmienna) -> {
    where(created_at: 3.days.ago..Time.now)
  }

  scope :by_user,(user_name) -> {
    where(user: user_name)
  }

end
