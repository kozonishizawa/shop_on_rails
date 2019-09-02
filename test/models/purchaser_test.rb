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

require 'test_helper'

class PurchaserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
