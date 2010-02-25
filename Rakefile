require 'grancher/task'
require 'rake'
require 'rake/testtask'
require 'rake/rdoctask'
require 'spec/rake/spectask'

desc 'Default: run all specs across all supported Rails gem versions.'
task :default => :spec

begin
  require 'jeweler'
  Jeweler::Tasks.new do |s|
    s.name = 'admin_assistant'
    s.version = '1.0.0'
    s.date = '2009-08-02'
    s.author = 'Francis Hwang'
    s.description = 'admin_assistant is a Rails plugin that automates a lot of features typically needed in admin interfaces.'
    s.summary = 'admin_assistant is a Rails plugin that automates a lot of features typically needed in admin interfaces.'
    s.email = 'sera@fhwang.net'
    s.homepage = 'http://github.com/fhwang/admin_assistant/tree/master'
    s.files = FileList[%w(
      MIT-LICENSE README *.rb Rakefile generators/**/*.* lib/*.rb lib/admin_assistant/*.rb
      lib/admin_assistant/*/*.rb lib/images/*.png lib/javascripts/*.js
      lib/stylesheets/*.css lib/views/*.erb tasks/*.rake
      vendor/ar_query/MIT-LICENSE vendor/ar_query/README vendor/ar_query/*.rb
      vendor/ar_query/*/*.rb vendor/ar_query/*/*.rake
    )].to_a
    s.add_dependency 'will_paginate'
  end
rescue LoadError
  puts "Jeweler, or one of its dependencies, is not available. Install it with: sudo gem install technicalpickles-jeweler -s http://gems.github.com"
end

# run with rake publish
Grancher::Task.new do |g|
  g.branch = 'gh-pages'
  g.push_to = 'origin' # automatically push too
  
  g.directory 'website'
end

desc 'Generate documentation for the admin_assistant plugin.'
Rake::RDocTask.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = 'AdminAssistant'
  rdoc.options << '--line-numbers' << '--inline-source'
  rdoc.rdoc_files.include('README')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

desc 'Run all specs across all supported Rails gem versions.'
task :spec do
  supported_versions = %w(2.1.0 2.1.2 2.2.2 2.3.2 2.3.3 2.3.4)
  locally_installed_versions =
      `gem list --local rails`.split(/\n/).
          detect { |l| l=~ /^rails / }.strip.
          gsub(/^.*\((.*)\).*$/, '\1').split(/\s*,\s*/)
  missing = supported_versions - locally_installed_versions
  if !missing.empty? && !ENV['INSTALLED_VERSIONS']
    puts "Missing Rails versions #{missing.join(',')}; please install and then re-run tests, " \
         "or run against installed versions by running with the INSTALLED_VERSIONS variable set"
  else
    cmd = "cd test_rails_app && " + (
      locally_installed_versions.map { |version|
        "echo '===== Testing #{version} =====' && RAILS_GEM_VERSION=#{version} rake"
      }.join(" && ")
    )
    puts cmd
    puts `#{cmd}`
  end
end

