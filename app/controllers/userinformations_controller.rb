class UserinformationsController < ApplicationController

  def create

  end

  def new
    @user_info = UserInformation.new
    @user = User.find(params[:user_id])
    authorize @user_info
  end
end
