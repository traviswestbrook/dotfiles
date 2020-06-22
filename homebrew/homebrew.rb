#!/usr/bin/ruby

class HomebrewInstaller
    def run
        system('/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"')
    end

    def should_run
        return `which brew`.to_s.empty?
    end

   def undo
       system('/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/uninstall.sh)"')
   end
end

class Homebrew
    def run
        system('brew bundle --file="~/.dotfiles/homebrew/Brewfile"')
    end

    def should_run
        true
    end
    
    def undo
    end
end
