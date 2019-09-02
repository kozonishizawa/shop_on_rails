class ApplicationController < ActionController::Base

  before_action:set_current_user
  protect_from_forgery with: :exception
  helper_method :current_cart, :total_price, :total_quantity
  include SessionsHelper

  #ログイン中のユーザー
  def set_current_user
  	@current_user = User.find_by(id: session[:user_id])
  end

  #アクセス制限（ログインしていないユーザー）
  def authenticate_user
    unless logged_in?
      store_location
  		flash[:danger] = "ログインが必要です"
  		redirect_to login_url
  	end
  end

  #アクセス制限（ログイン中のユーザー）
  def forbid_login_user
  	if @current_user
  		flash[:danger] = "すでにログインしています"
  		redirect_to("/products/index")
  	end
  end

  #アクセス制限（カートが空）
  def authenticate_cart
    @cart_items = current_cart.cart_items
    if @cart_items.empty?
      redirect_to("/products/index")
      flash[:danger] = "カート内に商品はありません"
    end
  end

  #アクセス制限（支払い方法が未設定）
  def authenticate_method
    if current_cart.method == nil
      redirect_to("/products/index")
      flash[:danger] = "先にお支払い方法を設定して下さい"
    end
  end

  #管理者認証
  def authenticate_admin
    if @current_user.admin == false
      redirect_to("/products/index")
      flash[:danger] = "アクセス権限がありません"
    end
  end

  #買い物カゴ
  def current_cart
    if session[:cart_id]
      cart = Cart.find_by(id: session[:cart_id])
    else
      cart = Cart.create
      session[:cart_id] = cart.id
    end
    return cart
  end
  
  #カート内商品の合計金額
  def total_price
    cart_items = current_cart.cart_items
    total_price = 0
    cart_items.each_with_object(0) do |cart_item, quantity|
      price = cart_item.product.price * cart_item.quantity
      total_price += price
    end
    total_price
  end

  #カート内商品の合計数量
  def total_quantity
    cart_items = current_cart.cart_items
    total_quantity = 0
    cart_items.each do |cart_item|
      total_quantity += cart_item.quantity
    end
    total_quantity
  end
private

    def setup_cart_item
      @cart_item = current_cart.cart_items.find_or_initialize_by(product_id: params[:id])
    end

end
