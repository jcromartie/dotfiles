require 'fileutils'

# Tracks all files in tracked.txt relative to the home directory by
# pulling them into the root of the repo. Hopefully there aren't any
# conflicts... hmm.

tracked = FileList.new(File.read("tracked.txt").split("\n")).pathmap("home/%p")
HOME = ENV["HOME"]

namespace :dotfiles do
  tracked.each do |f|
    local_path = f.pathmap "#{HOME}/%p"

    file f => local_path do |t|
      FileUtils.mkdir_p File.dirname(f)
      FileUtils.cp_r local_path, f
    end


    if File.exist? f
      file local_path do |t|
        FileUtils.cp_r f, local_path
      end
    end
  end

  desc "Slurp up all of files in tracked.txt into the dotfile repo"
  task :slurp => tracked

  local_paths = tracked.pathmap("#{HOME}/%p")
  desc "Install all backup files into location"
  task :install => local_paths
end
