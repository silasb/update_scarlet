require 'fileutils'

desc "Install update script to home folder"
task :install do
  home_bin_dir = File.join(ENV['HOME'], 'bin')
  if File.directory? home_bin_dir
    cp 'src/update_scarlet', home_bin_dir
    puts ""
    puts "Now move src/update.bash to your webserver and modify the script in your $HOME/bin directory to point to that file."
  else
    mkdir home_bin_dir
    Rake::Task[:install].execute
  end
end

task :default => [:install]
