last_type_name = ''

require 'csv'

CSV.foreach 'listas/pescados.csv' do |row|
  	if row[0] != last_type_name
  		type = Type.create( name: row[0])
  		@type_id = type.id
  		last_type_name = type.name
  	end

  	food = Food.create(name: row[1], type_id: @type_id)
  	NutritionalInformation.create(food_id: food.id,  
  									energy: row[2], 
  									proteins: row[3],
  									fat: row[4],
  									hydrates: row[5])
end