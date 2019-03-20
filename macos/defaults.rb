#!/usr/bin/ruby

require './util/command.rb'

# Command to print current defaults to clipboard `defaults read | pbcopy`
class MacOsxDefaults
    def initialize
        press_and_hold = Command.new("defaults write -g ApplePressAndHoldEnabled -bool", "false", "true")
        dock_auto_hide = Command.new("defaults write com.apple.dock autohide -bool", "true", "false")
        inital_key_repeat = Command.new("defaults write -g InitialKeyRepeat -int", "10", "15")
        key_repeat = Command.new("defaults write -g KeyRepeat -int", "1", "2")
        bottom_left_sleep = Command.new("defaults write com.apple.dock wvous-bl-corner -int", "5", "0")
        bottom_left_modifier = Command.new("defaults write com.apple.dock wvous-bl-modifier  -int", "0", "0")
        toolbar_battery_percent = Command.new("defaults write com.apple.menuextra.battery ShowPercent -string", "YES", "NO")
        xcode_build_time = Command.new("defaults write com.apple.dt.Xcode ShowBuildOperationDuration -bool", "true", "false")
        @defaults = [
            press_and_hold, 
            dock_auto_hide,
            inital_key_repeat,
            key_repeat,
            bottom_left_sleep,
            bottom_left_modifier,
            toolbar_battery_percent,
            xcode_build_time,
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