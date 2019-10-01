# == Schema Information
#
# Table name: product_stocks
#
#  id         :bigint           not null, primary key
#  product_id :bigint
#  color      :string(255)
#  size       :integer          default("free"), not null
#  quantity   :integer          default(0), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ProductStock < ApplicationRecord

  #----------------------------------------
  #  ** Includes **
  #----------------------------------------

  #----------------------------------------
  #  ** Constants **
  #----------------------------------------

  #----------------------------------------
  #  ** Enums **
  #----------------------------------------

  enum size: { free: 0, xs: 1, s: 2, m: 3, l: 4, xl: 5 }

  #----------------------------------------
  #  ** Validations **
  #----------------------------------------

  #validates :color,	   presence: true, length: {maximum: 30}
  validates :size,	   presence: true, inclusion: { in: ProductStock.sizes.keys }
  validates :quantity, numericality: {greater_than_or_equal_to: 0}, allow_nil: true

  #----------------------------------------
  #  ** Associations **
  #----------------------------------------

  belongs_to :product

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
