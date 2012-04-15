class CreateFoodLineItems < ActiveRecord::Migration
  def change
    create_table :food_line_items do |t|
      t.integer :diet_id
      t.integer :food_id
      t.float :ammount

      t.timestamps
    end
  end
end
