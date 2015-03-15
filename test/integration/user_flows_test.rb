require 'test_helper'

class UserFlowsTest < ActionDispatch::IntegrationTest

  test "user can sign in" do 
    get '/login'
    assert_response :success

    post_via_redirect '/login', session: { name: users(:valid_user).name,
                                           password: 'password' }
    assert_equal '/', path
#    assert_equal 'Signed in successfully!', flash[:notice]
  end

end
