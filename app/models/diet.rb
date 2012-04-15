class Diet < ActiveRecord::Base
  attr_accessible :active, :profile_id
  has_many :food_line_items
end
