class RemoveBrokerMetadata < ActiveRecord::Migration
  def up       
    remove_column :refinery_brokers, :urlpath
    remove_column :refinery_brokers, :is_active
    remove_column :refinery_brokers, :is_broker
    remove_column :refinery_brokers, :rank
    
    add_column :refinery_brokers, :is_broker, :binary
    #ensure that everyone is a broker by default
    Refinery::Brokers::Broker.all.each do |tenant|
      tenant.is_broker = true
      tenant.save
    end
  end

  def down
    remove_column :refinery_brokers, :is_broker
    
    add_column :refinery_brokers, :urlpath, :string
    add_column :refinery_brokers, :is_active, :integer
    add_column :refinery_brokers, :is_broker, :integer
    add_column :refinery_brokers, :rank, :integer
  end
end
