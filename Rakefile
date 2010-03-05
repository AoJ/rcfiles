require 'highline/import'
require 'fileutils'

task :setup do
  if agree("This will overwrite symlinks in your home dir!  Are you sure? (y/n)")
    home = ENV["HOME"]
    mydir = File.expand_path(File.dirname(__FILE__))
    Dir.foreach(mydir) do |filename|
      unless ['.','..','Rakefile','.git','.gitignore'].include? filename
        homepath = "#{home}/#{filename}"
        unless File.symlink?(homepath) || !File.exists?(homepath)
          puts "You must remove the file yourself: #{homepath}"
        else
          if agree("Symlink #{filename}?")
            FileUtils.safe_unlink homepath if File.exists? homepath
            FileUtils.ln_s("#{mydir}/#{filename}", "#{homepath}")
          end
        end
      end
    end
  end
end

task :diff do
  home = ENV["HOME"]
  mydir = File.expand_path(File.dirname(__FILE__))
  Dir.foreach(mydir) do |filename|
    unless ['.','..','Rakefile','.git'].include? filename
      puts "diffing #{home}/#{filename} #{filename}"
      puts %x{diff #{home}/#{filename} #{filename}}
    end
  end
end
