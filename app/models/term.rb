# == Schema Information
#
# Table name: terms
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  start_date :date
#  end_date   :date
#  created_at :datetime
#  updated_at :datetime
#

class Term < ActiveRecord::Base
  has_many :sections
  accepts_nested_attributes_for :sections, allow_destroy: true
end
