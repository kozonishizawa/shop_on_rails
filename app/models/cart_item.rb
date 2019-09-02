# == Schema Information
#
# Table name: cart_items
#
#  id         :bigint           not null, primary key
#  product_id :bigint
#  cart_id    :bigint
#  quantity   :integer          default(0)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class CartItem < ApplicationRecord

  belongs_to :product
  belongs_to :cart
  validates :quantity, numericality: {greater_than_or_equal_to: 0}
  
end
