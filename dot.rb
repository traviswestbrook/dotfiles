#!/usr/bin/ruby
require 'optparse'
require './plugins.rb'

options = {}

OptionParser.new { |option|
    option.on("--undo", "-u") { options[:undo] = true }
}.parse!

class Array
    def run
        self.select { |plugin| plugin.should_run }.each {|plugin| plugin.run}
    end

    def undo
        self.reverse.each { |plugin| plugin.undo}
    end
end

if options[:undo]
    $plugins.undo
else
    $plugins.run
end
