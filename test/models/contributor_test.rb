require 'test_helper'

class ContributorTest < ActiveSupport::TestCase
  test "contributor is valid" do 
    assert contributors(:valid_contributor).save
  end
end
