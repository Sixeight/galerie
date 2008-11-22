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
