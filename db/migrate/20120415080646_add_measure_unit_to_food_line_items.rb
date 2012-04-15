class AddMeasureUnitToFoodLineItems < ActiveRecord::Migration
  def change
    add_column :food_line_items, :measure_unit_id, :integer
  end
end
