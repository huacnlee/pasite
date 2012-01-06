class AddDeltaToSnippet < ActiveRecord::Migration
  def change
    add_column :snippets, :delta, :boolean, :default => true, :null => false
  end
end
