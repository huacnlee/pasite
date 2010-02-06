class AddCommentsCountToSnippets < ActiveRecord::Migration
  def self.up
    add_column :snippets, :comments_count, :integer,:default => 0
		add_column :users, :comments_count, :integer,:default => 0
  end
  
  def self.down
	  remove_column :snippets, :comments_count
		remove_column :users, :comments_count
  end
end