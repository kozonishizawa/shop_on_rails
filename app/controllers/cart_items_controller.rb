class CartItemsController < ApplicationController
  before_action :setup_cart_item, only: [:index, :create, :add_item, :destroy]
  before_action :authenticate_cart, only: [:order]

  def index
    @cart_items = current_cart.cart_items
  end

  def show
  end

  def new
  end

  def create
    @cart_item.update_attributes cart_item_params
    redirect_to cart_items_path, flash: {success: 'カートに商品を追加しました'}
  end

  def update
    cart_item = current_cart.cart_items.find_or_initialize_by(id: params[:id])
    params[:cart_item][:quantity].to_i != 0 ? cart_item.update!(cart_item_params) : cart_item.destroy
    redirect_to cart_items_path, flash: {success: 'カート内の商品を更新しました'}
  end

  def destroy
    @cart_item.destroy!
    redirect_to cart_items_path, flash: {success: 'カートから商品を取り出しました'}
  end

  def add_one
    cart_item = current_cart.cart_items.find_or_initialize_by(id: params[:id])
    cart_item.update.quantity.next
    redirect_to cart_items_path, flash: {success: 'カート内の商品をうんこしました'}
  end



private

    def cart_item_params
      params.require(:cart_item).permit :product_id, :quantity
    end
end