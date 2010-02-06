class AddColumnToSnippets < ActiveRecord::Migration
  def self.up
    add_column :snippets, :line_count, :integer, :null => false, :default => 0
    add_column :snippets, :summary_formatted, :text, :null => false, :default => ""
  end
  
  def self.down
    remove_column  :snippets,  :line_count
    remove_column  :snippets, :summary_formatted
  end
end
