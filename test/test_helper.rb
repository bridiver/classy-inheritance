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
    
    create_table :accounts, :force => true do |t|
      t.string :first_name
      t.string :last_name
      t.string :email

      t.timestamps
    end
    
    create_table :account_logins, :force => true do |t|
      t.string :login
      t.string :password
      t.integer :account_id

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

    create_table :artists, :force => true do |t|
      t.string :login
      t.integer :profile_id

      t.timestamps
    end

    create_table :addresses, :force => true do |t|
      t.string :line_one
      t.string :line_two
      t.string :city
      t.string :state_code
      t.string :postal_code

      t.timestamps
    end

    create_table :offices, :force => true do |t|
      t.string :name
      t.integer :billing_address_id
      t.integer :shipping_address_id

      t.timestamps
    end

    create_table :contents, :force => true do |t|
      t.string :name
      t.string :presentable_type 
      t.integer :presentable_id

      t.timestamps
    end

    create_table :pages, :force => true do |t|
      t.text :body

      t.timestamps
    end

    create_table :documents, :force => true do |t|
      t.string :version_file_name
      t.string :version_content_type
      t.integer :version_file_size

      t.timestamps
    end
  end
  
  def self.down
    drop_table :accounts
    drop_table :account_logins
    drop_table :authors
    drop_table :artists
    drop_table :users
    drop_table :profiles
    drop_table :offices
    drop_table :addresses
    drop_table :pages
    drop_table :documents
    drop_table :contents
  end
end

SetupTestTables.migrate(:up)

class Profile < ActiveRecord::Base
  validates_presence_of :first_name, :last_name, :email
end

class Account < ActiveRecord::Base
  validates_presence_of :first_name, :last_name, :email
end

class AccountLogin < ActiveRecord::Base
  validates_presence_of :login, :password
end

class User < ActiveRecord::Base
  validates_presence_of :login
end

class Author < ActiveRecord::Base
  validates_presence_of :login
end

# to test optional dependency
class Artist < ActiveRecord::Base
  validates_presence_of :login
end

# to test using standard relationship options (class_name, etc..)
class Address < ActiveRecord::Base
  validates_presence_of :line_one, :city, :postal_code
end

class Office < ActiveRecord::Base
  validates_presence_of :name
end

# Polymorphic classes
class Content < ActiveRecord::Base
  validates_presence_of :name
end

class Page < ActiveRecord::Base
  validates_presence_of :body
end

# Would typically use PaperClip for this...
class Document < ActiveRecord::Base
end
