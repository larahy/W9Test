class StoriesController < ApplicationController

  before_action :authenticate_user!, only: [:new, :update]

  def new
    @story = Story.new
  end

  def create
    Story.create params[:story].permit(:title, :url)
    redirect_to '/stories'
  end

  def index
    @stories = Story.most_popular(Story.all)
  end


end
