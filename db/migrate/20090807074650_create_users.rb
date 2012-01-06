# encoding: utf-8
class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :name, :null => false
      t.string :login, :null => false
      t.string :passwd, :null => false
      t.string :email, :null => false
      t.integer :snippets_count, :null => false, :default => 0
      t.string :bio
      t.string :url
      t.boolean :admin, :default => false

      t.timestamps
    end

    u = User.new(:name => 'admin',:login => 'admin', :passwd => 'f0ed32e0a349447990ea11911935c95a', :email => 'pastie@huacnlee.com',:admin => true)
    u.save
  end

  def self.down
    drop_table :users
  end
end
