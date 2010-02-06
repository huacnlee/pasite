require 'systemu'
require "uuidtools"
require "fileutils"
require 'string'

# snippet highlight
class Highlight    
  def self.format(code,type)
		fname = UUIDTools::UUID.random_create.to_s
		path = SNIPPET_UPLOAD_TEMP_DIR
    tmpfile = "#{path}#{fname}"
		if not File.directory? path
			FileUtils.makedirs(path)
		end
    f = File.new(tmpfile,"a")
    f.puts code
    f.close
    result = systemu("pygmentize -f html -l #{type} -O encoding=utf8,linenos=1 #{tmpfile}")
    File.delete(tmpfile)

    return result[1].gsub('<div class="highlight">','<div class="inner_code">')
  end
end
