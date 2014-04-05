begin
  require 'bundler/setup'
rescue LoadError
  fail 'You must `gem install bundler` and `bundle install` to run rake tasks'
end
fail 'Gemfile missing' unless defined? Bundler::GemHelper
Bundler::GemHelper.install_tasks

require 'rdoc/task'

RDoc::Task.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = 'Stringprep'
  rdoc.options << '--line-numbers'
  rdoc.rdoc_files.include('README.rdoc')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

desc 'Run RSpec specs'
task :spec do
  ARGV.delete 'spec'
  sh "bundle exec rspec #{ARGV.join ' '}"
end

task default: :spec
