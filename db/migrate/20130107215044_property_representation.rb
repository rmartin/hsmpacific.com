class PropertyRepresentation < ActiveRecord::Migration
  def change
    create_table :property_representations do |t|
      t.integer :broker_id
      t.integer :property_id

      t.timestamps
    end
  end
end
