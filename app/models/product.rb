# == Schema Information
#
# Table name: products
#
#  id          :bigint           not null, primary key
#  name        :string(255)
#  price       :integer
#  comment     :string(255)
#  category_id :integer
#  color       :string(255)
#  size        :integer          default(0)
#  stock       :integer          default(0)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Product < ApplicationRecord

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

  validates :name,	 	presence: true, length: {maximum: 30}
  validates :price, 	presence: true
  validates :comment, presence: true, length: {maximum: 140}
  validates :image,   presence: true, allow_nil: true
  validates_numericality_of :price, message: 'が有効な数値ではありません'

  #----------------------------------------
  #  ** Associations **
  #----------------------------------------

  belongs_to :category, optional: true
  has_one_attached :image

  # 在庫
  has_many :stocks, class_name: 'ProductStock', dependent: :delete_all
  accepts_nested_attributes_for :stocks

  #----------------------------------------
  #  ** Delegates **
  #----------------------------------------

  #----------------------------------------
  #  ** Scopes **
  #----------------------------------------

  #----------------------------------------
  #  ** Methods **
  #----------------------------------------

  def thumbnail

    self.image.variant(combine_options: {resize: '640x640^', crop:'640x640+0+0',gravity: :center}).processed
  end

  # 在庫の合計数
  def total_stock

    self.stocks.pluck(:quantity).sum
  end
end
