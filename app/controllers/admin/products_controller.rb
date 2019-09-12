class Admin::ProductsController < ApplicationController
  before_action :authenticate_admin, {only: [:new, :create, :edit, :update, :destroy]}

  def index
    @q = Product.ransack(params[:q])
    @products = @q.result(distinct: true).order('created_at DESC').paginate(page: params[:page]).per_page(20)
  end

  def new
  	@product = Product.new
  end

  def create
    @product = Product.new product_params
    if @product.save
      redirect_to admin_products_path, flash: {success: "商品「#{@product.name}」を登録しました"}
    else
      render :new
    end
  end

  def show
    @product = Product.find_by(id: params[:id])
  end

  def edit
  	@product = Product.find_by(id: params[:id])
  end

  def update
    @product = Product.find_by(id: params[:id])
    @product.update product_params
  	redirect_to admin_products_path, flash: {success: '商品情報を更新しました'}
  end

  def destroy
    @product = Product.find_by(id: params[:id])
  	@product.destroy
  	redirect_to admin_products_path, flash: {success: '出品を取りやめました'}
  end

  private
    def product_params
      params.require(:product).permit :name, :category_id, :price, :comment, :size, :stock, :image
    end

end
