class AddCaloriesToFoods < ActiveRecord::Migration
  def change
    add_column :foods, :calories, :float
  end
end
