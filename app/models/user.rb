class User < ApplicationRecord
  has_many :chows, :class_name => "Chow", :foreign_key => "user_1_id"
  has_many :secondary_chows, :class_name => "Chow", :foreign_key => "user_2_id"
  has_many :messages, :class_name => "Message", :foreign_key => "sender_id"
  has_many :secondary_messages, :class_name => "Message", :foreign_key => "recipient_id"
  has_many :badges
  has_many :preferences
  has_many :calendars
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable :validatable,
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :omniauthable, omniauth_providers: [:facebook]
  validates :email, presence: true, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  after_create :send_welcome_email
  after_create :set_up_profile

  GENDER = ["Agender", "Androgyne", "Androgynous",
    "Bigender",
    "Cisgender Female", "Cisgender Male",
    "Cisgender Man", "Cisgender Woman",
    "Gender Fluid", "Gender Nonconforming", "Gender Questioning",
    "Gender Variant", "Genderqueer",
    "Intersex",
    "Neutrois", "Non-binary", "Other",
    "Pangender",
    "Trans", "Trans*" "Trans Female", "Trans* Female", "Trans Male",
    "Trans* Male", "Trans Man", "Trans* Man", "Trans Person",
    "Trans* Person", "Trans Woman", "Trans* Woman", "Transfeminine",
    "Transgender", "Transgender Female", "Transgender Male",
    "Transgender Man", "Transgender Person", "Transgender Woman",
    "Transmasculine",
    "Two-Spirit"]

  CUISINES = ["american", "british", "cajun", "caribbean", "chinese",
    "filipino", "french", "german", "greek", "indian", "italian",
    "japanese", "jewish", "korean", "mediterranean", "mexican",
    "moroccan", "russian", "spanish", "thai", "turkish",
    "venezuelan", "vietnamese"]

  def self.find_for_facebook_oauth(auth)
    user_params = auth.slice(:provider, :uid)
    user_params.merge! auth.info.slice(:email, :first_name, :last_name, :birthday, :location)
    user_params[:facebook_picture_url] = auth.info.image
    user_params[:token] = auth.credentials.token
    user_params[:token_expiry] = Time.at(auth.credentials.expires_at)
    user_params = user_params.to_h

    user = User.find_by(provider: auth.provider, uid: auth.uid)
    user ||= User.find_by(email: auth.info.email) # User did a regular sign up in the past.
    if user
      user.update(user_params)
    else
      user = User.new(user_params)
      user.password = Devise.friendly_token[0,20]  # Fake password for validation
      user.save
    end

    return user
  end

  private

  def send_welcome_email
      UserMailer.welcome(self).deliver_now
  end

  def set_up_profile
    redirect_to edit_user_path(@user)
  end
end
