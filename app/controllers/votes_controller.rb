class VotesController < ApplicationController


  def create
    @story = Story.find(params[:story_id])
    @vote = Vote.new
    @vote.user = current_user
    @vote.story = @story
    @vote.save
    redirect_to '/stories'
  end

  def destroy 
    @vote = current_user.votes.find(params[:id])
    @vote.destroy
    redirect_to '/stories'
  end

end

