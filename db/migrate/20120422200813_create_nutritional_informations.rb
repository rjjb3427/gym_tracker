class CreateNutritionalInformations < ActiveRecord::Migration
  def change
    create_table :nutritional_informations do |t|
      t.integer :food_id
      t.float :energy
      t.float :proteins
      t.float :fat
      t.float :hydrates

      t.timestamps
    end
  end
end
