require 'rubygems'
require 'activerecord'

require 'test/unit'
require File.dirname(__FILE__) + '/../lib/classy-inheritance'

ActiveRecord::Base.establish_connection({
      :adapter => "sqlite3",
      :dbfile => "test/database.sqlite3"
})

class SetupTestTables < ActiveRecord::Migration
  def self.up
    create_table :profiles, :force => true do |t|
      t.string :first_name
      t.string :last_name
      t.string :email

      t.timestamps
    end
    
    create_table :users, :force => true do |t|
      t.string :login
      t.integer :profile_id

      t.timestamps
    end
    
    create_table :authors, :force => true do |t|
      t.string :login
      t.integer :profile_id

      t.timestamps
    end
  end
  
  def self.down
    drop_table :authors
    drop_table :users
    drop_table :profiles
  end
end

SetupTestTables.migrate(:up)

class Profile < ActiveRecord::Base
  validates_presence_of :first_name, :last_name, :email
end

class User < ActiveRecord::Base
  validates_presence_of :login
end

class Author < ActiveRecord::Base
  validates_presence_of :login
end
