class VotesController < ApplicationController


  def create
    @story = Story.find(params[:story_id])
    @vote = Vote.new
    @vote.user_id = current_user.id
    @vote.story_id = @story.id 
    @vote.save
    redirect_to '/stories'
  end

  def destroy 
    @vote = current_user.votes.find(params[:id])
    @vote.destroy
    redirect_to '/stories'
  end

end

