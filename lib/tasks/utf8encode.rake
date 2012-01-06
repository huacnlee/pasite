# encoding: utf-8
desc "Manage the encoding header of Ruby files"
task :utf8_encode_headers => :environment do
  files = Array.new
  ["*.rb", "*.rake"].each do |extension|
    files.concat(Dir[ File.join(Dir.getwd.split(/\\/), "**", extension) ])
  end

  files.each do |file|
    content = File.read(file)
    next if content[0..16] == "# encoding: utf-8\n" ||
            content[0..22] == "# -*- encoding: utf-8 -*-"

   ["\n\n", "\n"].each do |file_end|
      content = content.gsub(/(# coding: utf-8#{file_end})|(# encoding: utf-8#{file_end})|(# -*- coding: utf-8 -*-#{file_end})|(# -*- encoding: utf-8 -*-#{file_end})/i, "")
    end

    new_file = File.open(file, "w")
    new_file.write("# encoding: utf-8\n"+content)
    new_file.close
  end
end
