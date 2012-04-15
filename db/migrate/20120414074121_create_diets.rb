class CreateDiets < ActiveRecord::Migration
  def change
    create_table :diets do |t|
      t.boolean :active
      t.integer :profile_id

      t.timestamps
    end
  end
end
