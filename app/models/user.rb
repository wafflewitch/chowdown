class User < ApplicationRecord
  has_many :chows, :class_name => "Chow", :foreign_key => "user_1_id", dependent: :destroy
  has_many :secondary_chows, :class_name => "Chow", :foreign_key => "user_2_id", dependent: :destroy
  has_many :messages, :class_name => "Message", :foreign_key => "sender_id", dependent: :destroy
  has_many :secondary_messages, :class_name => "Message", :foreign_key => "recipient_id", dependent: :destroy
  has_many :badges, :class_name => "Badge", :foreign_key => "user_id", dependent: :destroy
  has_many :calendars, dependent: :destroy
  has_many :decisions, :class_name => "Decision", :foreign_key => "user_1_id", dependent: :destroy
  has_many :secondary_decisions, :class_name => "Decision", :foreign_key => "user_2_id", dependent: :destroy
  has_many :matches, :class_name => "User", through: :decisions
  has_many :recipes, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable :validatable,
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :omniauthable, omniauth_providers: [:facebook]
  validates :email, presence: true, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true

  after_create :send_welcome_email
  after_create :create_badges

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

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

  TAGS = ["american", "british", "cajun", "caribbean", "chinese",
    "filipino", "french", "german", "greek", "indian", "italian",
    "japanese", "jewish", "korean", "mediterranean", "mexican",
    "moroccan", "russian", "spanish", "thai", "turkish",
    "venezuelan", "vietnamese"]


  def pref_meat_icon
    if pref_meat
      img = "https://res.cloudinary.com/wafflewitch/image/upload/v1500649828/meat_yes.png"
    else
      img = "https://res.cloudinary.com/wafflewitch/image/upload/v1500649828/meat_no.png"
    end
  end

  def pref_fish_icon
    if pref_fish
      img = "https://res.cloudinary.com/wafflewitch/image/upload/v1500649828/fish_yes.png"
    else
      img = "https://res.cloudinary.com/wafflewitch/image/upload/v1500649828/fish_no.png"
    end
  end

  def pref_wheat_icon
    if pref_wheat
      img = "https://res.cloudinary.com/wafflewitch/image/upload/v1500649828/wheat_yes.png"
    else
      img = "https://res.cloudinary.com/wafflewitch/image/upload/v1500649828/wheat_no.png"
    end
  end

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

  def create_badges
    chef_badge = Badge.create(name: "good food", count: 0, category: "https://res.cloudinary.com/wafflewitch/image/upload/v1501251493/badge_chef_pink2.png", user_id: self.id)
    music_badge = Badge.create(name: "good music", count: 0, category: "https://res.cloudinary.com/wafflewitch/image/upload/v1501251493/badge_music_pink2.png", user_id: self.id )
    house_badge = Badge.create(name: "nice place", count: 0, category: "https://res.cloudinary.com/wafflewitch/image/upload/v1501251493/badge_house_pink2.png", user_id: self.id)
    smiley_badge = Badge.create(name: "lots of fun", count: 0, category: "https://res.cloudinary.com/wafflewitch/image/upload/v1501251493/badge_smiley_pink2.png", user_id: self.id)
  end

end
