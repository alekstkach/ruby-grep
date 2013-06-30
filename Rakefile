# encoding: utf-8

require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'

require 'jeweler'
Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://docs.rubygems.org/read/chapter/20 for more options
  gem.name = "ruby-grep"
  gem.homepage = "http://github.com/alekstkach/ruby-grep"
  gem.license = "MIT"
  gem.summary = %Q{enhaced grep program: higlights matches & filenames, shows line numbers}
  gem.description = %Q{enhaced grep program: higlights matches & filenames, shows line numbers}
  gem.email = "ale.tkachenko@gmail.com"
  gem.authors = ["aleks tkach"]
  gem.executables = ["ruby-grep"]
  # dependencies defined in Gemfile
end
Jeweler::RubygemsDotOrgTasks.new

require 'rdoc/task'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "ruby-grep #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
