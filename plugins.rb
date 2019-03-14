#!/usr/bin/ruby
require './homebrew/homebrew.rb'
require './xcode/xcode.rb'
require './macos/defaults.rb'
require './macos/touchid.rb'
require './vscode/vscode.rb'
require './zsh/zsh.rb'

$dot_plugins = [
    HomebrewInstaller.new, 
    Homebrew.new,
    XCodeInstaller.new,
    MacOsxDefaults.new,
    XCodeKeyBindings.new,
    VsCodeExtensions.new,
    EnableZsh.new
]

$bootstrap_plugins = [
    TouchIdLauncher.new
]