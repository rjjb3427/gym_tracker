class MeasureUnit < ActiveRecord::Base
  attr_accessible :name
  validates_presence_of :name
  has_many :food_line_items
end
