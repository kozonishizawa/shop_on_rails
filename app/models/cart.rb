# == Schema Information
#
# Table name: carts
#
#  id         :bigint           not null, primary key
#  method     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Cart < ApplicationRecord

	#----------------------------------------
  #  ** Includes **
  #----------------------------------------

  #----------------------------------------
  #  ** Constants **
  #----------------------------------------

  #----------------------------------------
  #  ** Enums **
	#----------------------------------------
	
	enum method: { bank_transfer: 0, credit: 1, cash_on_delivery: 2}

  #----------------------------------------
  #  ** Validations **
  #----------------------------------------

  #----------------------------------------
  #  ** Associations **
	#----------------------------------------
	
	has_many :cart_items, dependent: :destroy

  #----------------------------------------
  #  ** Delegates **
  #----------------------------------------

  #----------------------------------------
  #  ** Scopes **
  #----------------------------------------

  #----------------------------------------
  #  ** Methods **
  #----------------------------------------
  
	# カートの合計金額
	def total_price

		self.cart_items.each_with_object([]) do |cart_item, result|
      result << cart_item.stock.product.price * cart_item.quantity
    end.sum
  end
  
  # カート内商品数
  def total_quantity

    self.cart_items.pluck(:quantity).inject(:+)
  end
end
