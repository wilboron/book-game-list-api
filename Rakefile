# frozen_string_literal: true

# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative 'config/application'
require 'rubocop/rake_task'

Rails.application.load_tasks

Rake::Task['default'].clear

task default: :environment do
  RuboCop::RakeTask.new(:rubocop)
  Rake::Task['rubocop'].invoke
  Rake::Task['parallel:spec'].invoke
end

task test: :environment do
  Rake::Task['parallel:spec'].invoke
end
