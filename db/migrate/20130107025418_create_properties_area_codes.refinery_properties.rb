# This migration comes from refinery_properties (originally 2)
class CreatePropertiesAreaCodes < ActiveRecord::Migration

  def up
    create_table :refinery_properties_area_codes do |t|
      t.string :name
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-properties"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/properties/area_codes"})
    end

    drop_table :refinery_properties_area_codes

  end

end
