class UsersController < ApplicationController
  before_action :ensure_user, only: [:show]

  def new
    @user = User.new
    @categories = Category.all.order(:priority)
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:id] = @user.id
      redirect_to root_path, notice: 'Signed up succesfully'
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    @articles = @user.articles
    session[:url] = "/users/#{params[:id]}"
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end
end
