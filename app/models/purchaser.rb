# == Schema Information
#
# Table name: purchasers
#
#  id           :bigint           not null, primary key
#  user_id      :bigint
#  kana         :string(255)
#  last_name    :string(255)
#  first_name   :string(255)
#  postal_code  :integer
#  prefecture   :string(255)
#  city         :string(255)
#  address      :string(255)
#  phone_number :string(255)
#  email        :string(255)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Purchaser < ApplicationRecord

  belongs_to :user, optional: true
	has_many :ordered_items, dependent: :destroy
	
	validates :kana, {presence: true}
	validates :last_name, {presence: true}
	validates :first_name, {presence: true}
	validates :postal_code, {presence: true}
	validates :prefecture, {presence: true}
	validates :city, {presence: true}
	validates :address, {presence: true}
	validates :email, {presence: true, confirmation: true} 
	validates :phone_number, format: {with: /\A[0-9]{3}[0-9]{4}[0-9]{4}\z/}

end
