require 'highline/import'
require 'fileutils'
require 'erb'

repo_dir = File.expand_path(File.dirname(__FILE__))

# Inspired/partially-copied from Ryanb's Dotfiles
# http://github.com/ryanb/dotfiles

desc "install all the dotfiles into the user's home directory"
task :install do
  batch_mode = agree("replace all files?")

  Dir['*'].each do |file|
    next if %w[Rakefile README.md LICENSE].include? file

    if %w[bin].include? file
      home_file = File.join(ENV['HOME'], "#{file}")
    else
      home_file = File.join(ENV['HOME'], ".#{file.sub('.erb','')}")
    end

    if File.exists?(home_file)
      if File.identical? file, home_file
        puts "identical #{home_file}"
      elsif batch_mode
        replace_file(home_file,file)
      elsif agree("overwrite #{home_file}? (y/n)")
        replace_file(home_file,file)
      end
    else
      link_file(home_file,file)
    end
  end
end

desc "update dotfiles"
task :update do
  %Q{git pull}
  Rake::Task["install"].execute
end

def replace_file(hf,f)
  system %Q{rm "#{hf}"}
  link_file(hf,f)
end

def link_file(hf,f)
  if f =~ /.erb$/
    if agree("regenerate #{f}?")
      puts "generating #{hf}"
      File.open(hf, 'w') do |nf|
        nf.write ERB.new(File.read(f)).result(binding)
      end
    end
  else
    puts "linking #{hf}"
    system %Q{ln -s "#{f}" "#{hf}"}
  end
end
