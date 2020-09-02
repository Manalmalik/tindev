class UserInformationsController < ApplicationController

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

  def toggle_status
    @user_status = current_user.user_information
    authorize @user_status
    if @user_status.online == true
      @user_status.online = false
    else
      @user_status.online = true
    end
    @user_status.save
    redirect_to '#'
  end

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
