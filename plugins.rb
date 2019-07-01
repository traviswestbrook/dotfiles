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
    MacOsxDefaults.new,
    XCodeKeyBindings.new,
    VsCodeExtensions.new,
    CopyZshrc.new,
    GitConfigs.new,
    BinInstaller.new,
    Homebrew.new,
]

$bootstrap_plugins = [
    TouchIdLauncher.new,
    HomebrewInstaller.new, 
    Homebrew.new,
    XCodeInstaller.new,
    EnableZsh.new,
    EnableOhMyZsh.new,
    Powerlevel9kInstaller.new,
]