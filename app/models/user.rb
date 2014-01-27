class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :stories
  has_many :votes

  def find_vote_for(story)
    story.votes.find_by(user_id: id)
  end

  
end
