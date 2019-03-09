#!/usr/bin/ruby
require './homebrew/homebrew.rb'

$plugins = [
    HomebrewInstaller.new, 
    Homebrew.new
]