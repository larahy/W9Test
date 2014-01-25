class Story < ActiveRecord::Base
  belongs_to :user
  has_many :votes

  def self.most_popular(stories)
    stories.sort_by(&:vote_count)
  end

  def vote_count
    -votes.count
  end 

  def votes_per_minute       
  	votes.count / ((Time.now - created_at) / 60)
  end

  def hotness
  	if self.votes_per_minute > 100
  		"Off the Richter"
  	else 
  		self.votes_per_minute.round(2)
  	end 	
  end

end