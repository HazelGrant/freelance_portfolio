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

  test "get edit if signed in" do 
    sign_in users(:valid_user)
    get :edit, id: portfolio_pieces(:valid_piece)
    assert_response :success
  end

  test "redirect from edit if not signed in" do 
    get :edit, id: portfolio_pieces(:valid_piece)
    assert_response :redirect
  end

  test "put update if signed in" do 
    sign_in users(:valid_user)

    put :update, id: portfolio_pieces(:valid_piece),
                 portfolio_piece: { name: "New Name" }

    assert_response :redirect
    assert PortfolioPiece.find(portfolio_pieces(:valid_piece).id).name == "New Name"
  end

  test "redirect from update if not signed in" do 
    put :update, id: portfolio_pieces(:valid_piece),
                 portfolio_piece: { name: "New Name" }

    assert_response :redirect
    assert_not PortfolioPiece.find(portfolio_pieces(:valid_piece).id).name == "New Name"
  end

  test "invalid update re-renders edit" do 
    sign_in users(:valid_user)

    put :update, id: portfolio_pieces(:valid_piece),
                 portfolio_piece: { name: "" }

    assert flash[:alert] == "Could not save piece."
    assert_template 'edit'
  end

  test "signed in user can destroy" do 
    sign_in users(:valid_user)

    assert_difference('PortfolioPiece.count', -1) do 
      delete :destroy, id: portfolio_pieces(:valid_piece)
    end

    assert flash[:notice] == "Portfolio piece destroyed."
    assert_response :redirect
  end

  test "not signed in user cannot destroy" do
    assert_no_difference('PortfolioPiece.count') do 
      delete :destroy, id: portfolio_pieces(:valid_piece)
    end

    assert_response :redirect
  end

end
