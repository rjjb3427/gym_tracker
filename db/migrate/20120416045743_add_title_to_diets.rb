class AddTitleToDiets < ActiveRecord::Migration
  def change
    add_column :diets, :title, :string
  end
end
