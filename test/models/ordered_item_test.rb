# == Schema Information
#
# Table name: ordered_items
#
#  id           :bigint           not null, primary key
#  product_id   :bigint
#  purchaser_id :bigint
#  quantity     :integer          default(0)
#  method       :integer
#  paid         :boolean          default(FALSE)
#  shipped      :boolean          default(FALSE)
#  completed    :boolean          default(FALSE)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'test_helper'

class OrderedItemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
