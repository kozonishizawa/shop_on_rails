class Admin::ProductsController < ApplicationController
  before_action :authenticate_admin

  def index
    @q = Product.ransack(params[:q])
    @categories = Category.all
    @products = @q.result(distinct: true).order('created_at DESC').paginate(page: params[:page]).per_page(20)
  end

  def new
    @product = Product.new
    @product.stocks.build([
      {size: :free},
      {size: :xs},
      {size: :s},
      {size: :m},
      {size: :l},
      {size: :xl},
    ])
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
      params.require(:product).permit :name, :category_id, :price, :comment, :image, stocks_attributes: [:id, :color, :size, :quantity]
    end

    def search_params
      params.require(:q).permit(:name_cont)
    end
end
