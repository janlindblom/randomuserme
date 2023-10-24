require 'rubygems'
require 'rubygems/command.rb'
require 'rubygems/dependency_installer.rb'
begin
  Gem::Command.build_args = ARGV
  rescue NoMethodError
end
inst = Gem::DependencyInstaller.new
begin
  if Gem.win_platform?
    inst.install 'tzinfo-data', '~> 1.2023'
  end
  rescue
    exit(1)
end
