require 'test_helper'

class PortfolioPiecesControllerTest < ActionController::TestCase

  test "get index" do 
    get :index
    assert_response :success
  end

  test "get show" do 
    get :show, id: portfolio_pieces(:valid_piece)
    assert_response :success
  end

end
