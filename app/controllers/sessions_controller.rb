class SessionsController < ApplicationController
  def new
    @categories = Category.all.order(:priority)
  end

  def create
    @user = User.find_by(name: params[:name])
    if @user
      session[:id] = @user.id
      redirect_to root_path, notice: "Logged in succefully"
    else
      flash.now.alert = "User not found"
      render :new
    end
  end

  def delete
    session.delete(:id)
    redirect_to '/sessions'
  end
end
