class Image < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :path

  file_column :path, :magick => {
    :versions => {
      :thumb => '120x120',
    }
  },
  :web_root => 'images/',
  :root_path => File.join(RAILS_ROOT, 'public', 'images')
end
