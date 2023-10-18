require "test_helper"

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
      @user = User.new(name: "Example User", email: "user@example.com")
      # Fails with the introduction of VALID_EMAIL_REGEX
      # @user2 = User.new(email: "Example User", name: "user2@example.com")
  end

  test "should be valid" do
      assert @user.valid?
      # assert @user2.valid?
  end

  test "name should be present" do
      @user.name = "   "
      assert_not @user.valid?
  end

  test "email should be present" do
      @user.email = "   "
      assert_not @user.valid?
  end

  test "name should not be too long" do
      @user.name = "a" * 51
      assert_not @user.valid?
  end

  test "email should not be too long" do
      @user.email = "a" * 244 + "@example.com"
      assert_not @user.valid?
  end

  test "email validation should accept valid email addresses" do
      # creating an array of example email formats
      valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org first.last@foo.jp alice+bob@baz.cn]
      # for all the emails format in the valid_address array,
      valid_addresses.each do | valid_address |
          # assign them sequentially to the user email
          @user.email = valid_address
          # and regard it as valid
          assert @user.valid?, "#{valid_address.inspect} should be valid"
      end
  end

  test "email validation should reject invalid email addresses" do
      invalid_addresses = %w[user@example,com user_at_foo.org user.name@example. foo@bar_baz.com foo@bar+baz.com]
      invalid_addresses.each do | invalid_address |
          @user.email = invalid_address
          assert_not @user.valid?, "#{invalid_address.inspect} should be invalid"
      end
  end

end
