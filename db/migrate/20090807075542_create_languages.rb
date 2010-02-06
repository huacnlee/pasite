class CreateLanguages < ActiveRecord::Migration
  def self.up
    create_table :languages do |t|
      t.string :name, :null => false
			t.string :slug, :null => false
      t.integer :snippets_count, :null => false, :default => 0

      t.timestamps
    end

		# init languages data
		languages = [
						{:name => "ActionScript", :slug => "as3", :snippets_count => 0},	
						{:name => "Apache Config file (.conf)",:slug => "apacheconf", :snippets_count => 0},
						{:name => "AppleScript",:slug => "applescript", :snippets_count => 0},
						{:name => "BBCode",:slug => "bbcode", :snippets_count => 0},
						{:name => "Bash",:slug => "bash", :snippets_count => 0},
						{:name => "Bash Session",:slug => "console", :snippets_count => 0},
						{:name => "Windows Batchfile(.bat)",:slug => "bat", :snippets_count => 0},
						{:name => "C",:slug => "c", :snippets_count => 0},
						{:name => "C#",:slug => "csharp", :snippets_count => 0},
						{:name => "C++",:slug => "cpp", :snippets_count => 0},
						{:name => "CSS",:slug => "css", :snippets_count => 0},
						{:name => "CSS Django",:slug => "css+django", :snippets_count => 0},
						{:name => "CSS PHP",:slug => "css+php", :snippets_count => 0},
						{:name => "CSS Ruby",:slug => "css+erb", :snippets_count => 0},
						{:name => "CSS Smarty",:slug => "css+smarty", :snippets_count => 0},
						{:name => "Cheetah",:slug => "cheetah", :snippets_count => 0},
						{:name => "Common Lisp",:slug => "common-lisp", :snippets_count => 0},
						{:name => "Cython",:slug => "cython", :snippets_count => 0},
						{:name => "D",:slug => "d", :snippets_count => 0},
						{:name => "Debian Control file",:slug => "control", :snippets_count => 0},
						{:name => "Debian Sourcelist",:slug => "sourceslist", :snippets_count => 0},
						{:name => "Delphi",:slug => "delphi", :snippets_count => 0},
						{:name => "Diff",:slug => "diff", :snippets_count => 0},
						{:name => "Django",:slug => "django", :snippets_count => 0},						
						{:name => "Erlang",:slug => "erlang", :snippets_count => 0},
						{:name => "Fortran",:slug => "fortran", :snippets_count => 0},
						{:name => "HTML",:slug => "html", :snippets_count => 0},
						{:name => "HTML Ruby (.erb)",:slug => "erb", :snippets_count => 0},
						{:name => "HTML Cheetah",:slug => "html+cheetah", :snippets_count => 0},
						{:name => "HTML Django",:slug => "html+django", :snippets_count => 0},
						{:name => "HTML PHP",:slug => "html+php", :snippets_count => 0},						
						{:name => "HTML Smarty",:slug => "html+smarty", :snippets_count => 0},
						{:name => "Haskell",:slug => "haskell", :snippets_count => 0},
						{:name => "INI",:slug => "ini", :snippets_count => 0},
						{:name => "IRC logs",:slug => "irc", :snippets_count => 0},
						{:name => "Java",:slug => "java", :snippets_count => 0},
						{:name => "Java Server Page (.jsp)",:slug => "jsp", :snippets_count => 0},
						{:name => "JavaScript",:slug => "js", :snippets_count => 0},
						{:name => "JavaScript Cheetah",:slug => "js+cheetah", :snippets_count => 0},
						{:name => "JavaScript Django",:slug => "js+django", :snippets_count => 0},
						{:name => "JavaScript PHP",:slug => "js+php", :snippets_count => 0},
						{:name => "JavaScript Ruby",:slug => "js+erb", :snippets_count => 0},
						{:name => "JavaScript+Smarty",:slug => "js+smarty", :snippets_count => 0},
						{:name => "LLVM",:slug => "llvm", :snippets_count => 0},
						{:name => "Lighttpd configuration file",:slug => "lighty", :snippets_count => 0},
						{:name => "Lua",:slug => "lua", :snippets_count => 0},
						{:name => "Makefile",:slug => "make", :snippets_count => 0},
						{:name => "MoinMoin/Trac Wiki markup",:slug => "trac-wiki", :snippets_count => 0},
						{:name => "Nginx configuration file",:slug => "nginx", :snippets_count => 0},
						{:name => "PHP",:slug => "php", :snippets_count => 0},
						{:name => "Perl",:slug => "perl", :snippets_count => 0},
						{:name => "Plain text",:slug => "text", :snippets_count => 0},
						{:name => "Python",:slug => "python", :snippets_count => 0},						
						{:name => "RHTML",:slug => "rhtml", :snippets_count => 0},
						{:name => "Ruby",:slug => "rb", :snippets_count => 0},
						{:name => "Ruby irb session",:slug => "rbcon", :snippets_count => 0},
						{:name => "Scala",:slug => "scala", :snippets_count => 0},
						{:name => "Scheme",:slug => "scheme", :snippets_count => 0},
						{:name => "Smalltalk",:slug => "smalltalk", :snippets_count => 0},
						{:name => "Smarty",:slug => "smarty", :snippets_count => 0},
						{:name => "Squid Config file",:slug => "squidconf", :snippets_count => 0},
						{:name => "SQL",:slug => "sql", :snippets_count => 0},
						{:name => "Tcl",:slug => "tcl", :snippets_count => 0},
						{:name => "TeX",:slug => "tex", :snippets_count => 0},						
						{:name => "Vim file",:slug => "vim", :snippets_count => 0},
						{:name => "XML",:slug => "xml", :snippets_count => 0},
						{:name => "XSLT",:slug => "xslt", :snippets_count => 0},
						{:name => "YAML",:slug => "yaml", :snippets_count => 0},
						]
		languages.each do |l|
			l = Language.new(l)
			l.save
		end
  end

  def self.down
    drop_table :languages
  end
end
