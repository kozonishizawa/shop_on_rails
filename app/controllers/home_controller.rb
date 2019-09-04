class HomeController < ApplicationController

  before_action:forbid_login_user, {only: [:top]}

  def top
    #@products = Product.order('created_at DESC').paginate(page: params[:page]).per_page(8)
  end

  def about
  end

  def contact
  end
  
end

