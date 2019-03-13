#!/usr/bin/ruby

class Array
    def run
        self.each {|plugin| plugin.run}
    end

    def undo
        self.reverse.each { |plugin| plugin.undo}
    end

    def filter
        self.select { |plugin| plugin.should_run }
    end
end