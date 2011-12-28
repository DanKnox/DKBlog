class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :omniauthable, :rememberable, :database_authenticatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  
  class << self
    def find_for_github_oauth(access_token, signed_in_resource=nil)
      logger.info access_token.inspect
      data = access_token.extra['raw_info']
      if user = User.where(:login => data['login']).first
        user
      else # Create a user with a stub password. 
        User.create!(:login => data['login'], :password => Devise.friendly_token[0,20]) 
      end
    end
  
    def new_with_session(params, session)
      super.tap do |user|
        if data = session["devise.github_data"] && session["devise.github_data"]["extra"]["user_hash"]
          user.email    = data["email"]
          user.name     = data["name"]
          user.image    = data["image"]
          user.location = data["location"]
        end
      end
    end
  end
end
