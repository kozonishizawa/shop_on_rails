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
#  size       :integer          default("nosize")
#  stock      :integer          default(0)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "should not save product without name" do
  product = Product.new
  assert_not product.save
end
end
