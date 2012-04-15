class FoodLineItem < ActiveRecord::Base
  attr_accessible :ammount, :food_id
  validates_presence_of :ammount
  belongs_to :diet
  belongs_to :food
  belongs_to :measure_unit
end
