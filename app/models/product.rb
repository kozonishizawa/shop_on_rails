# == Schema Information
#
# Table name: products
#
#  id         :bigint           not null, primary key
#  name       :string(255)
#  price      :integer
#  comment    :string(255)
#  category   :integer
#  color      :string(255)
#  size       :integer          default(0)
#  stock      :integer          default(0)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Product < ApplicationRecord
    has_one_attached :image
	has_many :cart_items, dependent: :destroy
    has_many :ordered_items, dependent: :destroy
	validates :name,	 	presence: true, length: {maximum: 30}
	validates :price, 	 	presence: true
    validates :comment,  	presence: true, length: {maximum: 140}
    validates :image, presence: true, allow_nil: true
    validates_numericality_of :price, :message => "が有効な数値ではありません"
    validates :stock, numericality: {greater_than_or_equal_to: 0}, allow_nil: true

    enum size: { nosize: 0, XS: 1, S: 2, M: 3, L: 4, XL: 5 }

    def thumbnail
        return self.image.variant(combine_options: {resize: '640x640^', crop:'640x640+0+0',gravity: :center}).processed
    end
end
