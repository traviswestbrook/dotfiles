#!/usr/bin/ruby
require './plugins.rb'
require './options.rb'
require './plugin_extensions.rb'

plugins = $dot_plugins

if $options[:name]
    plugins = plugins.select { |plugin| plugin.class.name.include?($options[:name]) }
end

if $options[:undo]
    plugins.undo
else
    plugins.filter.run
end
