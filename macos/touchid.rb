#!/usr/bin/ruby

class TouchIdLauncher

    def run
        `open /System/Library/PreferencePanes/TouchID.prefPane/`
    end

    def should_run
        true
    end

    def undo
    end
    
end