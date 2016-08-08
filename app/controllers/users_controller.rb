class UsersController < ApplicationController

  def show
    @nickname = current_user.nickname
    @tweets = Tweet.where(user_id: current_user.id).order("id DESC").page(params[:page]).per(5)
  end
end
