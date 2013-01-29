class AddIsAdminToProfile < ActiveRecord::Migration
  def change
    add_column :profiles, :isAdmin, :boolean, :default => false
  end
end
