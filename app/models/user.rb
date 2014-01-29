class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  has_many :stories
  has_many :votes

  def find_vote_for(story)
    story.votes.find_by(user_id: id)
  end

  def self.twitter_auth auth 
    credentials = { uid: auth[:uid], provider: :twitter }
    pwd = Devise.friendly_token[0,20]

    User.find_or_create_by(credentials) do |user|
      user.username = auth[:info][:name]
      user.password = pwd
      user.password_confirmation = pwd
    end
  end

  def self.gplus_auth auth 
    credentials = { uid: auth[:uid], provider: :gplus }
    pwd = Devise.friendly_token[0,20]

    User.find_or_create_by(credentials) do |user|
      user.username = auth[:info][:name]
      user.email = auth[:info][:email]
      user.password = pwd
      user.password_confirmation = pwd
    end
  end

  def from_twitter?
    provider == 'twitter'
  end

  def email_required?
    return false if from_twitter?
    super
  end

  def password_required?
    return false if from_twitter?
    super
  end

  def update_with_password(params, *options)
    if from_twitter?
      update_attributes(params, *options)
    else
      super
    end
  end

  
end
