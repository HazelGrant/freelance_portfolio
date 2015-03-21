require 'test_helper'

class ImagesControllerTest < ActionController::TestCase
  test "get show" do 
    get :show, portfolio_piece_id: portfolio_pieces(:valid_piece), id: images(:valid_image)
    assert_response :success
  end

  test "get index" do 
    get :index, portfolio_piece_id: portfolio_pieces(:valid_piece)
    assert_response :success
  end

  test "signed in user: get new" do 
    sign_in users(:valid_user)
    get :new, portfolio_piece_id: portfolio_pieces(:valid_piece)
    assert_response :success
  end

  test "not signed in user: get new" do 
    get :new, portfolio_piece_id: portfolio_pieces(:valid_piece)
    assert_response :redirect
  end

  test "signed in user: post create" do 
    sign_in users(:valid_user)

    assert_difference('Image.count') do 
      post :create, portfolio_piece_id: portfolio_pieces(:valid_piece), image: { description: "Hello" }
    end

    assert_response :redirect
  end

  test "signed in user: get edit" do 
    sign_in users(:valid_user)
    
    get :edit, portfolio_piece_id: portfolio_pieces(:valid_piece), id: images(:valid_image)
    assert_response :success
  end

  test "signed in user: update" do 
    sign_in users(:valid_user)

    put :update, portfolio_piece_id: portfolio_pieces(:valid_piece), id: images(:valid_image), image: { description: "Goodbye" }
    
    assert flash[:notice] = "Image saved."
    assert_response :redirect
  end
end
