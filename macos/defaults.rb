#!/usr/bin/ruby

# Command to print current defaults to clipboard `defaults read | pbcopy`


class MacOsxDefault
    def initialize(command, value, original_value)
        @command = command
        @value = value
        @original_value = original_value
    end
    
    def run
        `#{@command} #{@value}`
    end

    def undo
        `#command #original_value`
    end
end

class MacOsxDefaults
    def initialize
        press_and_hold = MacOsxDefault.new("defaults write -g ApplePressAndHoldEnabled -bool", "false", "true")
        dock_auto_hide = MacOsxDefault.new("defaults write com.apple.dock autohide -bool", "true", "false")
        inital_key_repeat = MacOsxDefault.new("defaults write -g InitialKeyRepeat -int", "10", "15")
        key_repeat = MacOsxDefault.new("defaults write -g KeyRepeat -int", "1", "2")
        bottom_left_sleep = MacOsxDefault.new("defaults write com.apple.dock wvous-bl-corner -int", "5", "0")
        bottom_left_modifier = MacOsxDefault.new("defaults write com.apple.dock wvous-bl-modifier  -int", "0", "0")
        toolbar_battery_percent = MacOsxDefault.new("defaults write com.apple.menuextra.battery ShowPercent -string", "YES", "NO")
        @defaults = [
            press_and_hold, 
            dock_auto_hide,
            inital_key_repeat,
            key_repeat,
            bottom_left_sleep,
            bottom_left_modifier,
            toolbar_battery_percent,
        ]
    end

    def run
        @defaults.each { |default| default.run}
    end

    def should_run
        true
    end
    
    def undo
        @defaults.each { |default| default.undo}
    end
end