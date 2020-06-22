#!/usr/bin/ruby
require './plugins.rb'
require './options.rb'
require './plugin_extensions.rb'

if $options[:undo]
    $bootstrap_plugins.undo
else
    $bootstrap_plugins.filter.run
end

require './dot.rb'
