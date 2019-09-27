class UsersController < ApplicationController

  before_action:authenticate_user, {only: [:show, :edit, :update]}
  before_action:forbid_login_user, {only: [:new, :create, :login_form, :login]}
  before_action:ensure_correct_user, {only: [:show, :edit, :update]}

  def show
    @user = User.find_by(id: params[:id])
    redirect_to root_url and return unless @user.activated?
  end

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
      @user.send_activation_email
      flash[:info] = "ご登録いただいたアドレスにメールを送信いたしました。メールの本文からアカウント有効化の手続きを行って下さい。"
      params[:page] == '0' ? redirect_to(root_url) : redirect_to(procedures_login_form_path)
  	else
  		params[:page] == '1' ? render('/signup') : render('/procedures/new')
  	end
  end

  def edit
  	@user = User.find_by(id: params[:id])
  end

  def update
  	@user = User.find_by(id: params[:id])
  	if @user.update user_params
  		redirect_to @user, flash: {success: "ユーザー情報を更新しました"}
  	else
  		render "edit"
    end
  end

  def logout
    session[:user_id] = nil
    flash[:notice]    = "ログアウトしました"
    redirect_to("/login")
  end

  def ensure_correct_user
    @user = User.find_by(id: params[:id])
    redirect_to(root_path) unless current_user?(@user)
  end

private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
