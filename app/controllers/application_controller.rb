class ApplicationController < ActionController::Base

  before_action :set_current_user
  before_action :setup_cart_item
  protect_from_forgery with: :exception
  helper_method :current_cart
  include SessionsHelper

  # ログイン中のユーザー
  def set_current_user
  	@current_user = User.find_by(id: session[:user_id])
  end

  # アクセス制限（ログインしていないユーザー）
  def authenticate_user
    unless logged_in?
      store_location
  		redirect_to login_url, flash: {danger: 'ログインが必要です'}
  	end
  end

  # アクセス制限（ログイン中のユーザー）
  def forbid_login_user
  	if @current_user
  		redirect_back_or root_path, flash: {danger: 'すでにログインしています'}
  	end
  end

  # アクセス制限（カートが空）
  def authenticate_cart
    if current_cart.cart_items.empty?
      redirect_to root_path, flash: {danger: 'カート内に商品がありません'}
    end
  end

  # アクセス制限（支払い方法が未設定）
  def authenticate_method
    unless current_cart&.method
      redirect_to root_path, flash: {danger: '先にお支払方法を設定してください'}
    end
  end

  # 管理者認証
  def authenticate_admin
    unless @current_user&.admin?
      redirect_to root_path, flash: {danger: 'アクセス権限がありません'}
    end
  end

  # 買い物カゴ
  def current_cart
    cart = Cart.find_or_create_by(id: session[:cart_id])
    session[:cart_id] = cart.id
    cart
  end

  private

    def setup_cart_item
      @cart_item = current_cart.cart_items.find_or_initialize_by(product_stock_id: params[:id])
    end
end
