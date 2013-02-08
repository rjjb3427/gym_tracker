class AddIndexesToTables < ActiveRecord::Migration
  def up
    add_index :diets, :profile_id
    add_index :food_line_items, :diet_id
    add_index :food_line_items, :food_id
    add_index :foods, :type_id
    add_index :nutritional_informations, :food_id
  end

  def down
    remove_index :diets, :profile_id
    remove_index :food_line_items, :diet_id
    remove_index :food_line_items, :food_id
    remove_index :foods, :type_id
    remove_index :nutritional_informations, :food_id
  end
end
