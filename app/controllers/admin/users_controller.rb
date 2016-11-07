class Admin::UsersController < ApplicationController
  before_action :logged_in_user
  before_action :verify_admin, only: [:index, :destroy]
  before_action :find_user, only: :destroy

  def show
  end

  def index
    @users = User.paginate page: params[:page]
  end
  
  def destroy
    if @user.destroy 
      flash[:success] = t "controllers.admin.users.flash.success.delete"
    else
      flash[:danger] = t "controllers.admin.users.flash.fail.delete"
    end
    redirect_to admin_users_path
  end

  private
  def find_user
    @user = User.find_by id: params[:id]
    if @user.nil?
      flash[:danger] = t "controllers.admin.danger"
      redirect_to admin_users_path
    end
  end
end
