# encoding: utf-8
class CreateSnippets < ActiveRecord::Migration
  def self.up
    create_table :snippets do |t|
      t.string :title, :null => false
      t.text :code, :null => false
      t.text :code_formatted, :null => false
      t.float :size, :default => 0
      t.references :language
      t.boolean :private,:null => false, :default => false
      t.references :user

      t.timestamps
    end
  end

  def self.down
    drop_table :snippets
  end
end
