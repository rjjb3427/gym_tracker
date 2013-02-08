class FoodLineItem < ActiveRecord::Base
  attr_accessible :amount, :food_id
  validates_presence_of :amount, :measure_unit
  validates_numericality_of :amount

  belongs_to :diet
  belongs_to :food
  belongs_to :measure_unit
end
