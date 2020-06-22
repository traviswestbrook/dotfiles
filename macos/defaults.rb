#!/usr/bin/ruby

require './util/command.rb'

# Command to print current defaults to clipboard `defaults read | pbcopy`
class MacOsxDefaults
    def initialize
        press_and_hold = Command.new("defaults write -g ApplePressAndHoldEnabled -bool", "false", "true")
        dock_auto_hide = Command.new("defaults write com.apple.dock autohide -bool", "true", "false")
        dock_clear_all_apps = Command.new("defaults delete com.apple.dock persistent-apps", "", "")
        inital_key_repeat = Command.new("defaults write -g InitialKeyRepeat -int", "10", "15")
        key_repeat = Command.new("defaults write -g KeyRepeat -int", "1", "2")
        bottom_left_sleep = Command.new("defaults write com.apple.dock wvous-bl-corner -int", "5", "0")
        bottom_left_modifier = Command.new("defaults write com.apple.dock wvous-bl-modifier  -int", "0", "0")
        toolbar_battery_percent = Command.new("defaults write com.apple.menuextra.battery ShowPercent -string", "YES", "NO")
        xcode_build_time = Command.new("defaults write com.apple.dt.Xcode ShowBuildOperationDuration -bool", "true", "false")
        show_path_in_title = Command.new("defaults write com.apple.finder _FXShowPosixPathInTitle -bool", "true", "false")
        show_all_files = Command.new("defaults write com.apple.finder AppleShowAllFiles -bool", "true", "false")
        show_path_bar = Command.new("defaults write com.apple.finder ShowPathbar -bool", "true", "false")
        show_status_bar = Command.new("defaults write com.apple.finder ShowStatusBar -bool", "true", "false")
        toolbar_hide_airplay = Command.new("defaults write 'com.apple.systemuiserver' 'NSStatusItem Visible com.apple.menuextra.airplay' -bool", "false", "true")
        toolbar_hide_airport = Command.new("defaults write 'com.apple.systemuiserver' 'NSStatusItem Visible com.apple.menuextra.airport' -bool", "false", "true")
        toolbar_show_volume = Command.new("defaults write 'com.apple.systemuiserver' 'NSStatusItem Visible com.apple.menuextra.volume' -bool", "true", "false")

        @defaults = [
            press_and_hold, 
            dock_auto_hide,
            dock_clear_all_apps,
            inital_key_repeat,
            key_repeat,
            bottom_left_sleep,
            bottom_left_modifier,
            toolbar_battery_percent,
            xcode_build_time,
            show_path_in_title,
            show_all_files,
            show_path_bar,
            show_status_bar,
            toolbar_hide_airplay,
            toolbar_hide_airport,
            toolbar_show_volume,
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