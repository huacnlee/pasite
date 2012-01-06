# encoding: utf-8
class AddDescToSnippets < ActiveRecord::Migration
  def self.up
    add_column :snippets, :desc, :string
    add_column :snippets, :views_count, :integer, :null => false, :default => 0
  end

  def self.down
    remove_column :snippets, :desc
    remove_column :snippets, :views_count
  end
end

