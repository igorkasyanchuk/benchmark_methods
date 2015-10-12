$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

require 'rubygems'
require 'active_record'
require 'pry'
require 'simplecov'

SimpleCov.start

require 'benchmark_methods'

require_relative 'app.rb'

def clean_db
  User.delete_all
  Comment.delete_all
  Db::Account.delete_all
end
