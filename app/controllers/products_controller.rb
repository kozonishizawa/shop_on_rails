class ProductsController < ApplicationController

  before_action:authenticate_user, {only: [:new, :create, :edit, :update, :destroy]}
  before_action:authenticate_admin, {only: [:new, :create, :edit, :update, :destroy]}
  before_action :setup_cart_item, only: [:show]
  
  def index
  	@products = Product.order('created_at DESC').paginate(page: params[:page]).per_page(20)
  end

  def show
    @product = Product.find_by(id: params[:id])
  end

  def new
  	@product = Product.new
  end


  def create
    Product.create! product_params
    redirect_to products_path, flash: {success: '商品を登録しました'}
  end

  def edit
  	@product = Product.find_by(id: params[:id])
  end

  def update
    @product = Product.find_by(id: params[:id])
    @product.update product_params
  	redirect_to products_path, flash: {success: '商品情報を更新しました'}
  end

  def destroy
    @product = Product.find_by(id: params[:id])
  	@product.destroy
  	redirect_to products_path, flash: {success: '出品を取りやめました'}
  end

private
    def product_params
      params.require(:product).permit :name, :category, :price, :comment, :size, :stock, :image
    end

end
