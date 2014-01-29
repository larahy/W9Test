class VotesController < ApplicationController


  def create
    @story = Story.find(params[:story_id])
    @vote = Vote.new
    @vote.user = current_user
    @vote.story = @story
    @vote.save
    redirect_to '/stories'
    WebsocketRails[:votes].trigger 'update', {id: @story.id, score: @story.votes.count}
  end

  def destroy 
    @story = Story.find(params[:story_id])
    @vote = current_user.votes.find(params[:id])
    @vote.destroy
    redirect_to '/stories'
    WebsocketRails[:votes].trigger 'update', {id: @story.id, score: @story.votes.count}
  end

end

