require 'test_helper'

class PortfolioContributionTest < ActiveSupport::TestCase
  test "valid contribution is valid" do 
    assert portfolio_contributions(:valid_contribution).save
  end
end
