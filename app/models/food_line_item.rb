class FoodLineItem < ActiveRecord::Base
  attr_accessible :ammount, :food_id
  belongs_to :diet
  belongs_to :food
end
