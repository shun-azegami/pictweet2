class UsersController < ApplicationController

  def show
    user = User.find(params[:id])
    @nickname = current_user.nickname
    @tweets = user.tweets.order("id DESC").page(params[:page]).per(5)
  end
end
