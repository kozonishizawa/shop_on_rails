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

	has_many :cart_items, dependent: :destroy

	enum method: { bank_transfer: 0, credit: 1, cash_on_delivery: 2}

end
