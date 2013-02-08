class Food < ActiveRecord::Base
  attr_accessible :name, :type_id, :nutritional_information
  validates_presence_of :name
  belongs_to :type
  has_one :nutritional_information
end
