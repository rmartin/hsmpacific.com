class AddPropertyStateTypeFields < ActiveRecord::Migration
  def up
    add_column :refinery_properties, :state_code, :string
    add_column :refinery_properties, :property_type, :string
  end

  def down
    remove_column :refinery_properties, :state_code
    remove_column :refinery_properties, :property_type
  end
end