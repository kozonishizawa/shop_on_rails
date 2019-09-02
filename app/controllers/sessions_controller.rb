class SessionsController < ApplicationController
	before_action:authenticate_user, {only: [:destroy]}
	before_action:forbid_login_user, {only: [:new, :create]}
	
	def new
  end

  def create
  	user = User.find_by(email: params[:email].downcase)
  	if user && user.authenticate(params[:password])
			if user.activated?
				log_in user
	  	  params[:remember_me] == '1' ? remember(user) : forget(user)
				params[:page] == '0' ? redirect_back_or(user) : redirect_back_or(procedures_entry_form_path)
			else
				message = "アカウントが有効ではありません"
				message += "メールを確認して下さい"
				flash[:warning] = message
				params[:page] == '0' ? redirect_to(root_url) : redirect_to(cart_items_path)
			end
  	else
			flash.now[:danger] = 'メールアドレスとパスワードの組み合わせが正しくありません'
			params[:page] == '0' ? render('new') : render("/procedures/login_form")
    end
  end

  def destroy
  	log_out if logged_in?
  	redirect_to root_url
  end

end