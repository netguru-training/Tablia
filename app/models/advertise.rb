class Advertise
  include Mongoid::Document
  include Mongoid::Timestamps

  validates_presence_of :title, :body
  before_save :rand_sponsored
  mount_uploader :photo, ProductUploader

  field :title, type: String
  field :body, type: String
  field :sponsored, type: Boolean, default: false 

  belongs_to  :user
  belongs_to  :category

  index({ user: 1 }, { unique: true, name: "user_index" })
  index({ title: 1 }, { unique: false, name: "title_index" })
  index({ body: 1 }, {unique: true, name: "body_index" })
  index({ created_at: 1 }, { unique: false, name: "created_at" })

  scope :recent, -> {
    where(created_at: 3.days.ago..Time.now)
  }

  #scope :by_user, -> (user_name) {
  #  includes(:user).where(user: { first_name: user_name }).or.where(user: { last_name: user_name })
  #}

  scope :by_title, -> (title) {
    any_of({ :title => Regexp.new(".*#{title}.*", Regexp::IGNORECASE) })
  }

  scope :by_phrase, -> (text) {
    any_of({ :body => Regexp.new(".*#{text}.*", Regexp::IGNORECASE) })
  }

  private

  def rand_sponsored
    r=Random.rand(0..100)
    if r>70
      sponsored=true
    end
  end

end
