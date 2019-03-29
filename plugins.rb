#!/usr/bin/ruby
require './homebrew/homebrew.rb'
require './xcode/xcode.rb'
require './macos/defaults.rb'
require './macos/touchid.rb'
require './vscode/vscode.rb'
require './zsh/zsh.rb'
require './git/git.rb'
require './bin_setup/bin.rb'

$dot_plugins = [
    HomebrewInstaller.new, 
    Homebrew.new,
    XCodeInstaller.new,
    MacOsxDefaults.new,
    XCodeKeyBindings.new,
    VsCodeExtensions.new,
    EnableZsh.new,
    EnableOhMyZsh.new,
    CopyZshrc.new,
    Powerlevel9kInstaller.new,
    GitConfigs.new,
    BinInstaller.new,
]

$bootstrap_plugins = [
    TouchIdLauncher.new
]