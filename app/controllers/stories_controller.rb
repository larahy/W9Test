class StoriesController < ApplicationController

  before_action :authenticate_user!, only: [:new, :update]

  def new
    @story = Story.new
  end

  def create
    @story = Story.new params[:story].permit(:title, :url)
    @story.user = current_user
    @story.save 
    redirect_to '/stories'
  end

  def index
    @stories = Story.most_popular(Story.all)
  end

  def destroy
    @story = Story.find(params[:id])
    @story.destroy
    redirect_to '/stories'
  end

  def search
    @stories = Story.where("title ILIKE ?", "%#{params[:query]}%")
    render 'index'
  end


end
