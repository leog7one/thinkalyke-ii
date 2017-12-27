class Thinker < ActiveRecord::Base

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook]

  has_many :thoughts, dependent: :destroy
  has_many :attendances
  has_many :attended_thoughts, through: :attendances
  has_many :comments

  validates :username, presence:true,length: {minimum: 3}

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user| 
      user.email = auth.info.email 
      user.password = Devise.friendly_token[0,20]
    end
  end

  def to_s
  	"#{username}"
  end
end
