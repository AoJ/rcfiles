require 'highline/import'
require 'fileutils'
require 'erb'

repo_dir = File.expand_path(File.dirname(__FILE__))

# Inspired/partially-copied from Ryanb's Dotfiles
# http://github.com/ryanb/dotfiles

desc "install all the dotfiles into the user's home directory"
task :install => [:update_submodules] do
    Dir['*'].each do |file|
        next if %w[osx Rakefile README.md LICENSE].include? file

        # specify any files that shouldn't be dotfiles here (like bin dirs)
        if %w[bin].include? file
            home_file = File.join(ENV['HOME'], "#{file}")
        else
            home_file = File.join(ENV['HOME'], ".#{file.sub('.erb','')}")
        end

        if File.exists?(home_file)
            replace_file(home_file,file)
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

desc "update submodules"
task :update_submodules do
    `git submodule init && git submodule update`
end

def replace_file(hf,f)
    system %Q{rm "#{hf}"}
    link_file(hf,f)
end

def link_file(hf,f)
    if f =~ /.erb$/
        puts "generating #{hf}"
        File.open(hf, 'w') do |nf|
            nf.write ERB.new(File.read(f)).result(binding)
        end
    else
        file_path = File.expand_path(f)
        puts "linking #{hf}"
        system %Q{ln -s "#{file_path}" "#{hf}"}
    end
end
