# frozen_string_literal: true

require 'rspec/core/rake_task'

desc 'Run RSpec code examples (unit & integration tests, needs live instance)'
RSpec::Core::RakeTask.new('spec:all') do |task|
  task.pattern = './spec/**/*_spec.rb'
  task.rspec_opts = '-O .rspec-no-tags'
end

desc 'Run RSpec code examples (unit tests only)'
RSpec::Core::RakeTask.new(:spec) do |task|
  task.pattern = './spec/**/*_spec.rb'
  task.exclude_pattern = './spec/integration/**/*_spec.rb'
  task.rspec_opts = '-O .rspec'
end

desc 'Run RSpec code examples (integration tests only, needs live instance)'
RSpec::Core::RakeTask.new('spec:integration') do |task|
  task.pattern = './spec/**/*_spec.rb'
  task.rspec_opts = '-O .rspec --tag integration'
end

desc 'Run CI tests'
task ci: %i[spec]

task default: :spec