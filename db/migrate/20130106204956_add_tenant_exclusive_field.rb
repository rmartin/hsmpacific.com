class AddTenantExclusiveField < ActiveRecord::Migration
  def up
    add_column :refinery_tenants, :is_exclusive_tenant, :boolean
    #ensure that they are not an exclusive tenant by default
    Refinery::Tenants::Tenant.all.each do |tenant|
      tenant.is_exclusive_tenant = false
      tenant.save
    end
  end

  def down
    remove_column :refinery_tenants, :is_exclusive_tenant
  end
end
