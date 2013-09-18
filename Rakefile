require 'fileutils'

# Tracks all files in tracked.txt relative to the home directory by
# pulling them into the root of the repo. Hopefully there aren't any
# conflicts... hmm.

tracked = FileList.new(File.read("tracked.txt").split("\n"))
HOME = ENV["HOME"]

namespace :dotfiles do
  tracked.each do |f|
    backup = f.pathmap "home/%p"
    local_path = f.pathmap "#{HOME}/%p"

    file backup => local_path do |t|
      FileUtils.mkdir_p File.dirname(backup)
      FileUtils.cp_r local_path, backup
    end


    if File.exist? backup
      file local_path do |t|
        FileUtils.cp_r backup, local_path
      end
    end
  end

  backups = tracked.pathmap "home/%p"
  desc "Slurp up all of files in tracked.txt into the dotfile repo"
  task :slurp => backups

  local_paths = tracked.pathmap "#{HOME}/%p"
  desc "Install all backup files into location"
  task :install => local_paths
end
