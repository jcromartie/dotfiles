require 'fileutils'

tracked = FileList.new(File.read("tracked.txt").split("\n"))
HOME = ENV["HOME"]

namespace :dotfiles do
  tracked.each do |f|
    local_path = f.pathmap "#{HOME}/%p"

    desc "make a backup of #{f}"
    file f => local_path do |t|
      FileUtils.mkdir_p File.dirname(f)
      FileUtils.cp_r local_path, f
    end


    if File.exist? f
      desc "install #{local_path}"
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
