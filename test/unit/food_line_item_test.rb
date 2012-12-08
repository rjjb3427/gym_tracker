require 'test_helper'

class FoodLineItemTest < ActiveSupport::TestCase
  should validate_presence_of :ammount
  should validate_numericality_of :ammount 

  should belong_to :diet
  should belong_to :food
  should belong_to :measure_unit
end