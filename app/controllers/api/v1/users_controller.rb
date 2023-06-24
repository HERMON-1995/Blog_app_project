class Api::V1::UsersController < ApplicationController
  skip_before_action :authenticate_user!
  protect_from_forgery with: :null_session

  def posts
    user = User.find(params[:user_id])
    render json: user.posts
  end
end
