# == Schema Information
#
# Table name: carts
#
#  id         :bigint           not null, primary key
#  method     :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Cart < ApplicationRecord

	has_many :cart_items, dependent: :destroy

end
