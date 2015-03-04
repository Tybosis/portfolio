# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

Rails.application.load_tasks

require 'rake/testtask'

 Rake::TestTask.new("test:features") do |t|
  t.libs << "lib"
  t.libs << "test"
  t.pattern = "test/features/*_test.rb"
 end
