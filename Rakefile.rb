require 'rubygems'
require 'bundler/setup'

require 'rspec/core/rake_task'

task :default => [:test]

desc "Run all test tasks"
task :test => [:generate, :rspec] do
  puts "Testing stage finished."
end

desc "generate sources from grammars"
task :generate do
  system("bundle exec tt lib/swimlane/dsl/*.treetop")
  raise "generation of sources failed!" unless $?.exitstatus == 0
end

desc "Run rspec on the spec directory"
RSpec::Core::RakeTask.new('rspec') do |task|
  task.rspec_opts = ['-I lib/swimlane', '-I lib/swimlane/dsl']
  task.pattern = 'spec/**/*_spec.rb'
end

desc "Run travis-lint on .travis.yml"
task :lint do
  system("bundle exec travis-lint")
  raise "travis-lint failed!" unless $?.exitstatus == 0
end
