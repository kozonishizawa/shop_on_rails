# == Schema Information
#
# Table name: ordered_items
#
#  id               :bigint           not null, primary key
#  product_stock_id :bigint
#  purchaser_id     :bigint
#  quantity         :integer          default(0)
#  method           :integer
#  paid             :boolean          default(FALSE)
#  shipped          :boolean          default(FALSE)
#  completed        :boolean          default(FALSE)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class OrderedItem < ApplicationRecord

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
	
	validates :quantity, numericality: {greater_than_or_equal_to: 0}

  #----------------------------------------
  #  ** Associations **
	#----------------------------------------
	
	belongs_to :stock, class_name: 'ProductStock', foreign_key: :product_stock_id
	belongs_to :purchaser

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
