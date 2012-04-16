class Diet < ActiveRecord::Base
  validates_presence_of :title
  attr_accessible :active, :profile_id, :title
  has_many :food_line_items
  belongs_to :profile
end
