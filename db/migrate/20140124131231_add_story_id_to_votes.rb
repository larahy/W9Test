class AddStoryIdToVotes < ActiveRecord::Migration
  def change
    add_reference :votes, :story, index: true
  end
end
