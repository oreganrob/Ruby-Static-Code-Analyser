#!/usr/bin/env ruby

# ENTRY POINT for detection tool
# run this script first from the command line
# Passing in the target application as an argument

require 'rubygems'
require 'ruby_parser'
require 'pp'
require 'erubis'
require 'inc/sexp_extended'
require 'inc/runner'
require 'inc/error'
require 'inc/visitors/visitor'
require 'inc/visitors/visitor_factory'

# recursively iterate through Checks...
# ...directories and include all files
Dir.glob('Checks**/**/*.rb').each do|f|
  require f
end

# START/ENTRY POINT
# for each argument passed in
# NB: arguments must be directories
ARGV.each do |arg|
  Runner.new.run_checker(arg)
end # argv.do