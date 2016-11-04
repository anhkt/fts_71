class UsersController < ApplicationController
  before_action :find_user, only: :show

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      log_in @user
      flash[:success] = t "sessions.signup_success"
      redirect_to @user
    else
      flash[:danger] = t "sessions.danger"
      render :new
    end
  end

  private
  def find_user
    @user = User.find_by id: params[:id]
    if @user.nil?
      flash.now[:danger] = t "sessions.danger"
      redirect_to root_path
    end
  end

  def user_params
    params.require(:user).permit :name, :email, :password,
      :password_confirmation
  end
end
