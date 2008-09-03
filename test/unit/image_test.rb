require 'test_helper'

class ImageTest < ActiveSupport::TestCase
  fixtures :images

  def test_unique_path
    img = Image.new
    img.path = 'images/img/dnd.png'
    assert_valid img
    img.path = 'images/img/dn.png'
    assert_valid !img
  end
end
