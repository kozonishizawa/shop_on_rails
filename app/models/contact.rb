# == Schema Information
#
# Table name: contacts
#
#  id           :bigint           not null, primary key
#  name         :string(255)
#  title        :string(255)
#  organization :string(255)
#  email        :string(255)
#  tel          :string(255)
#  body         :text(65535)
#  status       :integer          default(0)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Contact < ApplicationRecord
end