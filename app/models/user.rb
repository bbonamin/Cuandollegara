class User < ActiveRecord::Base
  has_many :favorites, :dependent => :destroy
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :account_type

  validates_uniqueness_of :email
  def self.find_for_facebook_oauth(access_token, signed_in_resource=nil)
	  data = access_token['extra']['user_hash']
	  if user = User.find_by_email(data["email"])
	    user
	  else # Create a user with a stub password. 
	    User.create(:email => data["email"], :password => Devise.friendly_token[0,20], :account_type => 'facebook') 
	  end
	end
end
