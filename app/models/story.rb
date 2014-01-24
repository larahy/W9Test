class Story < ActiveRecord::Base
  belongs_to :user
  has_many :votes

  def self.most_popular(stories)
    stories.sort_by(&:vote_count)
  end

  def vote_count
    -votes.count
  end

end