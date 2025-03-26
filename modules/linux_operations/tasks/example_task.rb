#!/usr/bin/env ruby
require 'json'

params = JSON.parse(STDIN.read)
require_relative File.join(params['_installdir'], 'linux_operations', 'files', 'rb_helper.rb')

puts useful_ruby.to_json
