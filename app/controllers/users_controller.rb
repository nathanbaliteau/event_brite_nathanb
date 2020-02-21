class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show]
  before_action :authenticate_user!, only: [:show]
  
  def show
    @user = User.find(params[:id])
    @events = @user.admin_events
  end

private

  def is_admin?
    if current_user == User.find(params[:id])
      flash[:alert] = "Vous ne pouvez pas accéder à ce contenu"
      redirect_to events_path
    else
      render :show
    end 
  end

end
