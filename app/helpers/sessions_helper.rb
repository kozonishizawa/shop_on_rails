module SessionsHelper

	 # 渡されたユーザーでログインする
  def log_in(user)
		session[:user_id] = user.id
	end

  # ユーザーのセッションを永続的にする
  def remember(user)
    user.remember
    cookies.permanent.signed[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
  end

  # 渡されたユーザーがログイン済みユーザーであればtrueを返す
  def current_user?(user)
    user == current_user
  end

  # 記憶トークンcookieに対応するユーザーを返す
  def current_user

    # 既にユーザー情報を取得済みの場合はそのまま返却
    return @current_user if @current_user.present?

    if session[:user_id]
      @current_user = User.find session[:user_id]
    elsif cookies.signed[:user_id]
      user = User.find cookies.signed[:user_id]
      if user.authenticated?(:remember, cookies[:remember_token])
        log_in user
        @current_user = user
      end
    end
  end

  # ユーザーがログインしていればtrue、その他ならfalseを返す
	def logged_in?
		current_user.present?
  end

  # 永続的セッションを破棄する
  def forget(user)
    user.forget
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
  end

 # 現在のユーザーをログアウトする
  def log_out
    forget current_user
    session.delete(:user_id)
    @current_user = nil
  end

  # 記憶したURL (もしくはデフォルト値) にリダイレクト
  def redirect_back_or(default)
    redirect_to(session[:forwarding_url] || default)
    session.delete(:forwarding_url)
  end

  # アクセスしようとしたURLを覚えておく
  def store_location
    session[:forwarding_url] = request.original_url if request.get?
  end
end
