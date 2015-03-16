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

  test "get new if signed in" do 
    sign_in users(:valid_user)
    get :new

    assert_response :success
  end

  test "redirect from new if not signed in" do 
    get :new
    assert_response :redirect
  end

  test "post create if signed in" do 
    sign_in users(:valid_user)
    
    assert_difference('PortfolioPiece.count') do 
      post :create, portfolio_piece: { name: "Freelance Portfolio" }
    end

    assert_redirected_to %r(\/portfolio-pieces/#{PortfolioPiece.last.id})
    assert flash[:notice] == "Successfully created Portfolio Piece."
  end

  test "signed in but invalid post create re-renders new" do 
    sign_in users(:valid_user)

    assert_no_difference('PortfolioPiece.count') do 
      post :create, portfolio_piece: { name: "" }
    end

    assert_template :new
    assert flash[:alert] == "Did not save Portfolio Piece."
  end
  
  test "redirect from create if not signed in" do 
    assert_no_difference("PortfolioPiece.count") do 
      post :create, portfolio_piece: { name: "Troll" }
    end

    assert_response :redirect
  end

end
