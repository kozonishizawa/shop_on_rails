class ProductsController < ApplicationController
  before_action :setup_cart_item, only: [:show]
  
  def index
    @q = Product.ransack(params[:q])
    @categories = Category.all
    @products = @q.result(distinct: true).reverse_order.paginate(page: params[:page]).per_page(20)
  end

  def show
    @product = Product.find params[:id]
  end

end
