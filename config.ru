ENV['RACK_ENV'] ||= 'development'
require "rubygems"
require "bundler/setup"
require 'byebug'

$LOAD_PATH << File.dirname(__FILE__) + '/lib'
require File.expand_path(File.join(File.dirname(__FILE__), 'lib', 'sinatra_auth_github'))
require File.expand_path(File.join(File.dirname(__FILE__), 'app'))

use Rack::Static, :urls => ["/css", "/img", "/js"], :root => "public"

run Example::App

# vim:ft=ruby
