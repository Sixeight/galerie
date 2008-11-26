# == Schema Information
# Schema version: 20081126100124
#
# Table name: groups
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Group < ActiveRecord::Base
  has_many :users

  validates_presence_of :name
  validates_uniqueness_of :name
end
