module ProductsHelper
  
  def total_stock
    products = Product.where(name: @product.name)
    total = 0
    products.each do |product|
      total += product.stock
    end
    total
  end

end
