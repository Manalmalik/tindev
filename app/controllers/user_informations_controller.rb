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

  def edit
    @user = User.find(params[:id])
    @user_info = @user.user_information
    authorize @user_info
  end

  def update
    @user = current_user
    @user_info = UserInformation.find(params[:id])
    authorize @user_info
    if @user_info.update(info_params)
      redirect_to request.referrer
    else
      render :edit
    end
  end

  # def toggle_status

  # end

  def show
    @user = User.find(params[:id])
    @user_info = @user.user_information
    authorize @user_info
    # authorize @user
  end

  private

  def info_params
    params.require(:user_information).permit(:github, :photo, :bio, :online)
  end
end
