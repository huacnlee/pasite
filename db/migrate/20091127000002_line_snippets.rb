class LineSnippets < ActiveRecord::Migration
  def self.up
    print "progressing..."
    Snippet.all.each do |s|
      s.save
      print "."
    end
    puts "done."
  end

  def self.down
  end
end

