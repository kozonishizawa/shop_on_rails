class Admin::UsersController < ApplicationController
  before_action :authenticate_admin

  def index
    @q = User.ransack(params[:q])
  	@users = @q.result(distinct: true).order('id ASC').paginate(page: params[:page])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      redirect_to admin_users_path, flash: {success: "ユーザー「#{@user.name}」を登録しました"}
    else
      render :new
    end
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find_by(id: params[:id])
    if @user.update user_params
      redirect_to admin_users_path
    else
      render :edit
    end
  end

  def destroy
    User.find_by(id: params[:id]).destroy
    redirect_to admin_users_path, flash: {success: 'ユーザーを削除しました'}
  end

  private

    def user_params
      params.require(:user).permit :name, :email, :password, :password_confirmation
    end

end
