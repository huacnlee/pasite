class AddOauthToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :oauth_token, :string, :null => false, :default => ""
		add_column :users, :oauth_secret, :string, :null => false, :default => ""
  end
  
  def self.down
    remove_column  :users,  :oauth_token
    remove_column  :users, :oauth_secret
  end
end