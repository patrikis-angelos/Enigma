class UsersController < ApplicationController
  def new
    @user = User.new
    @categories = Category.all.order(:priority)
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:id] = @user.id
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end
end
