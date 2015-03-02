require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = users(:valid_user)
  end

  test "can be created" do 
    user = User.new(name: "name",
                    password: "password",
                    password_confirmation: "password")
    assert user.save
  end

  test "responds to name" do 
    assert_respond_to @user, :name
  end

  test "responds to password_digest" do 
    assert_respond_to @user, :password_digest
  end

  test "responds to password" do 
    assert_respond_to @user, :password
  end
  
  test "responds to password_confirmation" do 
    assert_respond_to @user, :password_confirmation
  end

end
