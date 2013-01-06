# This migration comes from refinery_tenants (originally 1)
class CreateTenantsTenants < ActiveRecord::Migration

  def up
    create_table :refinery_tenants do |t|
      t.string :name
      t.integer :logo_id
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-tenants"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/tenants/tenants"})
    end

    drop_table :refinery_tenants

  end

end
