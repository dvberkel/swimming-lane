require 'rubygems'
require 'bundler/setup'

require 'rspec/core/rake_task'

task :default => [:test]

desc "Run all test tasks"
task :test => [:rspec] do
  puts "Testing stage finished."
end

desc "Run rspec on the spec directory"
RSpec::Core::RakeTask.new('rspec') do |task|
  task.rspec_opts = ['-I lib']
  task.pattern = 'spec/**/*_spec.rb'
end
