class TweetsController < ApplicationController

  before_action :move_to_index, except: :index # indexアクション以外が実行される前にhogeが実行される。

  def index
    @tweets = Tweet.includes(:user).order("created_at DESC").page(params[:page]).per(5)
  end

  def new
  end

  def create
    Tweet.create(image: tweet_params[:image], text: tweet_params[:text], user_id: current_user.id) #tweet_paramsはハッシュ

  end

  private
  def tweet_params
    params.permit(:text, :image)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

end