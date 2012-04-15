class Profile < ActiveRecord::Base
  attr_accessible :age, :gender, :height, :name, :weight
  has_many :diets
end
