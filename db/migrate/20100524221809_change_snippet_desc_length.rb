# encoding: utf-8
class ChangeSnippetDescLength < ActiveRecord::Migration
  def self.up
		change_column :snippets, :desc, :string, :limit => 2000
  end

  def self.down
		change_column :snippets, :desc, :string
  end
end
