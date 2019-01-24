require 'bundler'
Bundler.require

#$:.unshift File.expand_path("./../lib", __FILE__)
#require 'app/application'

require_relative './lib/app/application'

Application.new.perform