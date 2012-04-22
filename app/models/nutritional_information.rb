class NutritionalInformation < ActiveRecord::Base
  attr_accessible :energy, :fat, :food_id, :hydrates, :proteins
end
