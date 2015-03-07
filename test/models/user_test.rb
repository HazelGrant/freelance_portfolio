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

  test "must have name" do 
    user = User.new(password: "password",
                    password_confirmation: "password")
    assert_not user.save
  end

  test "must have password" do
    user = User.new(name: "name",
                    password_confirmation: "password")
    assert_not user.save
  end

  test "authenticated? should return false for a user with nil digest" do 
    assert_not @user.authenticated?('')
  end

  test "forget and remember toggle user.remember_digest existence" do 
    @user.remember
    assert_not @user.remember_digest.nil?

    @user.forget
    assert @user.remember_digest.nil?
  end

end
