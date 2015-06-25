class UsersController < ApplicationController
  before_filter :check_for_cancel, :only => [:create]
  def new 
    @user = User.new
  end
  def create
    @user = User.new(user_params) 
    if @user.save 
      session[:user_id] = @user.id 
      redirect_to '/' 
    else 
      redirect_to '/signup' 
    end 
  end
  private; def user_params
    params.require(:user).permit(:first_name,:last_name, :email, :password)
  end
  private; def check_for_cancel
    if params[:commit] == "Cancel"
      redirect_to '/'
    end
  end
end
