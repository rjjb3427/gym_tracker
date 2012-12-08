require 'test_helper'

class DietTest < ActiveSupport::TestCase
  should validate_presence_of :title
  should belong_to :profile
  should have_many :food_line_items
end
