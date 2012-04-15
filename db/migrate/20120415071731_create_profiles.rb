class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :name
      t.integer :age
      t.string :gender
      t.float :weight
      t.float :height

      t.timestamps
    end
  end
end
