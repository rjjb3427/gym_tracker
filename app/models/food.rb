class Food < ActiveRecord::Base
  attr_accessible :name, :type_id
  validates_presence_of :name
  belongs_to :type
  has_one :nutritionalInformation
end
