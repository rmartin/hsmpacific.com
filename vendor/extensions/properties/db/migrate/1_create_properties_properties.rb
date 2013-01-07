class CreatePropertiesProperties < ActiveRecord::Migration

  def up
    create_table :refinery_properties do |t|
      t.string :title
      t.text :highlights
      t.string :available_sf
      t.string :rates
      t.integer :flyer_id
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-properties"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/properties/properties"})
    end

    drop_table :refinery_properties

  end

end
