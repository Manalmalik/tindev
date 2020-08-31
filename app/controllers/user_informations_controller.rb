class UserInformationsController < ApplicationController


  def new
    @user_info = UserInformation.new
    @user = User.find(params[:user_id])
    authorize @user_info
    authorize @user
  end

  def create
    @user_info = UserInformation.new(info_params)
    @user_info.user = current_user
    authorize @user_info
    if @user_info.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def info_params
    params.require(:user_information).permit(:github, :photo, :bio, :online)
  end

end
