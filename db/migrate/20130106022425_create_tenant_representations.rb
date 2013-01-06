class CreateTenantRepresentations < ActiveRecord::Migration
  def change
    create_table :tenant_representations do |t|
      t.integer :broker_id
      t.integer :tenant_id

      t.timestamps
    end
  end
end
