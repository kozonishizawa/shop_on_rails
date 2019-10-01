class ProceduresController < ApplicationController
  require 'payjp'
	before_action :authenticate_cart
  before_action :authenticate_method, only: [:confirmation, :purchase]
  before_action :logged_in_user, only: [:entry_form]
  before_action :forbid_login_user, only: [:new, :create, :login_form, :nonmember_form]
  
  #購入者専用のログイン画面
  def login_form
  end

  def logged_in_user
    unless logged_in?
      store_location
  		redirect_to procedures_login_form_path
  	end
  end

  #購入者専用の新規登録画面
  def new
  	@user = User.new
  end

  #購入者情報の入力
  def entry_form
    @purchaser = Purchaser.find_or_initialize_by(user_id: @current_user&.id)
  end

  def nonmember_form
    @purchaser = Purchaser.find_or_initialize_by(id: session[:guest_id])
  end

  #購入者情報の確定
  def entry
    if logged_in? && @purchaser = Purchaser.find_or_create_by(user_id: @current_user&.id)
      @purchaser.update! purchaser_params
    elsif @purchaser = Purchaser.find_by(id: session[:guest_id])
      @purchaser.update! purchaser_params
    else
      @purchaser = Purchaser.create! purchaser_params
      session[:guest_id] = @purchaser.id
    end
    redirect_to procedures_select_method_path
  rescue
    render :entry_form
  end

  #支払い方法選択
  def select_method
  end

  #支払い方法の確定
  def decide_method
    if cart_params
      current_cart.update cart_params
      redirect_to procedures_confirmation_path
    else
      flash[:danger] = 'お支払い方法を選択して下さい'
      redirect_to procedures_select_method_path
    end
  end

  #注文内容の確認
  def confirmation

    if @current_user.present?
      @purchaser = Purchaser.find_by(user_id: @current_user.id)
    else
      @purchaser = Purchaser.find_by(id: session[:guest_id])
    end
  end

  #注文確定
  def purchase

    if @current_user.present?
      @purchaser = Purchaser.find_by(user_id: @current_user.id)
    else 
      @purchaser = Purchaser.find_by(id: session[:guest_id])
    end 

    OrderedItem.transaction do
      ordered_items = []

      current_cart.cart_items.each do |cart_item|
        ordered_items << OrderedItem.new(
          quantity: cart_item.quantity,
          product_stock_id: cart_item.product_stock_id,
          purchaser_id: @purchaser.id,
          method: current_cart.method
        )

        cart_item.stock.quantity -= cart_item.quantity
        raise '商品の在庫が不足しています' if cart_item.stock.quantity < 0
        cart_item.stock.save!
      end

      OrderedItem.import! ordered_items

      if current_cart.method == 1
         Payjp.api_key = ENV['PAYJP_SECRET_KEY']
         Payjp::Charge.create(currency: 'jpy', amount: current_cart.total_price, card: params['payjp-token'])
      end

      current_cart.cart_items.delete_all
      current_cart.update(method: nil)
    end
    PurchaserMailer.purchaser_email(@purchaser).deliver_now
    PurchaserMailer.order_notification.deliver_now

    redirect_to products_path, flash: {success: 'お買い上げありがとうございます!'}
  rescue => e
    render plain: e.message
  end

  private

    def purchaser_params
      params.require(:purchaser).permit(:kana, :last_name, :first_name, :postal_code, :prefecture, :city, :address, :phone_number, :email, :email_confirmation, :user_id)
    end
    
    def cart_params
      params.require(:cart).permit(:method)
    end

end



