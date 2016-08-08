class TweetsController < ApplicationController

  def index
    @tweets = Tweet.order("created_at DESC").page(params[:page]).per(5)
  end

  def new
  end

  def create
    Tweet.create(create_params)
  end

  private
  def create_params
    params.permit(:name, :text, :image)
  end

end