class AddPropertyForeignKeys < ActiveRecord::Migration
  def up
    add_column :refinery_properties, :city_id, :integer
    add_column :refinery_properties, :area_code_id, :integer
  
  end

  def down
    remove_column :refinery_properties, :city_id
    remove_column :refinery_properties, :area_code_id
  end
end
