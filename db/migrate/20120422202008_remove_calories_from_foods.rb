class RemoveCaloriesFromFoods < ActiveRecord::Migration
  def up
    remove_column :foods, :calories
      end

  def down
    add_column :foods, :calories, :float
  end
end
