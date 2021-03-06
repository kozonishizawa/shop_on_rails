# == Schema Information
#
# Table name: cart_items
#
#  id               :bigint           not null, primary key
#  product_stock_id :bigint
#  cart_id          :bigint
#  quantity         :integer          default(0)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class CartItem < ApplicationRecord

  #----------------------------------------
  #  ** Includes **
  #----------------------------------------

  #----------------------------------------
  #  ** Constants **
  #----------------------------------------

  #----------------------------------------
  #  ** Enums **
  #----------------------------------------

  #----------------------------------------
  #  ** Validations **
  #----------------------------------------

  validates :quantity, numericality: {greater_than_or_equal_to: 0}

  #----------------------------------------
  #  ** Associations **
  #----------------------------------------

  belongs_to :stock, class_name: 'ProductStock', foreign_key: :product_stock_id
  belongs_to :cart

  #----------------------------------------
  #  ** Delegates **
  #----------------------------------------

  #----------------------------------------
  #  ** Scopes **
  #----------------------------------------

  #----------------------------------------
  #  ** Methods **
  #----------------------------------------
  
end
