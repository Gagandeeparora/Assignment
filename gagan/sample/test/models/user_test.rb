require 'test_helper'

class UserTest < ActiveSupport::TestCase
	def setup
		@user = User.new(name: "Example User", email: "example@xyz.com", 
													password: "foo", password_confirmation: "foo")		
	end

	test "should be valid" do
		assert @user.valid?
	end

	test "name should be present" do
		@user.name = "     "
		assert_not @user.valid?
	end

	test "email should be present" do
		@user.email = "    "
		assert_not @user.valid?
	end

	test "name should not be long" do
		@user.name = "a" * 51
		assert_not @user.valid?
	end

	test "email should not be long" do
		@user.email = "a" * 249 + "@xyz.com"
		assert_not @user.valid?
	end

	test "email validation should accept valid addresses" do
		valid_addresses = %w[example@xyz.com gagan_deep@xyz.COM gagan@xyz.com gagan_deep-arora@foo.bar.com foo.bar@xyz.net]
		valid_addresses.each do |valid_address|
			@user.email = valid_address
			assert @user.valid?, "#{valid_address.inspect} should be valid"
		end
	end

	test "email validation should reject invalid addresses" do
		invalid_addresses = %w[examp@xyz,com abc_foo_bar.org abc@foo+bar.com abc.xyz@foo.bar@example.com]
		invalid_addresses.each do |invalid_address|
			@user.email = invalid_address
			assert_not @user.valid?, "#{invalid_address.inspect} should be invalid"
		end
	end

	test "email address should be unique" do
		duplicate_user = @user.dup
		duplicate_user.email = @user.email.upcase
		@user.save
		assert_not duplicate_user.valid?
	end

	test "email address should be saved in lower case" do
		mixed_case_email = "FoO@Bar.CoM"
		@user.email = mixed_case_email
		@user.save2
		assert_equal mixed_case_email.downcase, @user.reload.email
	end

	test "password should have minimum length" do
		@user.password = @user.password_confirmation = "a" * 5
		assert_not @user.valid?
	end
end