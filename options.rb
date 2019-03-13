#!/usr/bin/ruby
require 'optparse'

$options = {}

OptionParser.new { |option|
    option.on("--undo", "-u") { $options[:undo] = true }
    option.on("--name [NAME]", "-n [NAME]", String) { |name| $options[:name] = name}
}.parse!
