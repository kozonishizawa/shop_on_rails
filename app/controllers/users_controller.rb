class UsersController < ApplicationController

  before_action:authenticate_user, {only: [:index, :show, :edit, :update, :destroy]}
  before_action:forbid_login_user, {only: [:new, :create, :login_form, :login]}
  before_action:ensure_correct_user, {only: [:show, :edit, :update]}
  before_action:admin_user, {only: [:destroy]}

  def index
  	@users = User.where(activated: true).paginate(page: params[:page])
  end

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
  	if @user.update_attributes(user_params)
  		flash[:success] = "ユーザー情報を更新しました"
  		redirect_to @user
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
    redirect_to(products_index_path) unless current_user?(@user)
  end

  def destroy
    User.find_by(id: params[:id]).destroy
    flash[:success] = "ユーザーを削除しました"
    redirect_to users_url
  end



private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
