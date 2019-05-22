class AddNoRegionToMembers < ActiveRecord::Migration
  def change
    add_column :members, :no_region, :integer
    add_index :members, :no_region
  end
end
