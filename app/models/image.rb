# == Schema Information
# Schema version: 20080923053340
#
# Table name: images
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  path       :string(255)
#  comment    :text
#  created_at :datetime
#  updated_at :datetime
#  user_id    :integer
#

require 'RMagick'

class Image < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :path, :user_id

  file_column :path, :magick => {
    :versions => {
      :thumb   => '120x120',
      :display => {
        # at most 600x600 hack
        :size => ::Magick::Geometry.new(600, 600,
                                      nil, nil,
                                      ::Magick::GreaterGeometry)
      },
    }
  },
  :web_root => 'images/',
  :root_path => File.join(RAILS_ROOT, 'public', 'images')
end
