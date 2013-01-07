class RemoveBrokerMetadataAddBioField < ActiveRecord::Migration
  def up    
    add_column :refinery_brokers, :bio, :text
    remove_column :refinery_brokers, :professional_experience, :text
    remove_column :refinery_brokers, :assignments, :text
    remove_column :refinery_brokers, :clients, :text
    remove_column :refinery_brokers, :affiliations, :text
  end

  def down
    remove_column :refinery_brokers, :bio
    add_column :refinery_brokers, :professional_experience
    add_column :refinery_brokers, :assignments
    add_column :refinery_brokers, :clients
    add_column :refinery_brokers, :affiliations
  end
end
