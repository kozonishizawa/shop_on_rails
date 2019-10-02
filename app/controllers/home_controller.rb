class HomeController < ApplicationController

  def top
    @products = Product.all.reverse_order.paginate(page: params[:page]).per_page(8)
  end

  def about
  end

  def contact
  end
  
end

