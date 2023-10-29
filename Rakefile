require "bundler/gem_tasks"
require 'rspec/core/rake_task'
require 'yard'
require 'rubocop/rake_task'

RSpec::Core::RakeTask.new(:spec)

YARD::Rake::YardocTask.new do |t|
 t.files   = ['lib/**/*.rb']
 t.stats_options = ['--list-undoc']
end

RuboCop::RakeTask.new do |t|
  t.patterns = ['lib/**/*.rb']
  t.requires << 'rubocop-rake'
end
