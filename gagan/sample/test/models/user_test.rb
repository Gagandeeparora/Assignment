require 'test_helper'

class UserTest < ActiveSupport::TestCase
	def setup
		@user = User.new(name: "Example User", email: "example@xyz.com")		
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
		valid_addresses = %w[abc@xyz.com gagan_deep@xyz.COM gagan@xyz.com gagan_deep-arora@foo.bar.com foo.bar@xyz.net]
		valid_addresses.each do |valid_address|
			@user.email = valid_address
			assert @user.valid?, "#{valid_address.inspect} should be valid"
		end
	end

	test "email validation should reject invalid addresses" do
		invalid_addresses = %w[abc@xyz,com abc_foo_bar.org abc@foo+bar.com abc.xyz@foo.bar@example.com]
		invalid_addresses.each do |invalid_address|
			@user.email = invalid_address
			assert @user.valid?, "#{invalid_address.inspect} should be invalid"
		end
	end
end