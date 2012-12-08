require 'test_helper'

class ProfileTest < ActiveSupport::TestCase
	should validate_uniqueness_of :email
	should validate_presence_of :name
	should validate_presence_of :age
	should validate_presence_of :gender
	should validate_presence_of :weight
	should validate_presence_of :height
end
