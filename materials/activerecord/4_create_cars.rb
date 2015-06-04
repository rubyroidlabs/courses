require 'active_record'


# connect to MySQL with authentication
ActiveRecord::Base.establish_connection(
  adapter:  'mysql2',
  host:     'localhost',
  username: 'root',
  password: '',
  database: 'testone'
)


class AddSystemSettings < ActiveRecord::Migration
  def up
    create_table :cars do |t|
      t.string  :tag
      t.string  :color
      t.integer :user_id # what types of relations present in general?
    end

    add_column :cars, :sex, :string
  end

  def down
    drop_table :cars
  end
end

AddSystemSettings.new.up
