require 'test_helper'

class ImageTest < ActiveSupport::TestCase
  test "is valid" do 
    assert images(:valid_image).save
  end
end
