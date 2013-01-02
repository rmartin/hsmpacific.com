class CreateBrokersBrokers < ActiveRecord::Migration

  def up
    create_table :refinery_brokers do |t|
      t.string :name
      t.string :urlpath
      t.string :title
      t.string :email
      t.string :phone
      t.string :fax
      t.integer :headshot_id
      t.text :professional_experience
      t.text :assignments
      t.text :clients
      t.text :affiliations
      t.integer :is_active
      t.integer :is_broker
      t.integer :rank
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-brokers"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/brokers/brokers"})
    end

    drop_table :refinery_brokers

  end

end
