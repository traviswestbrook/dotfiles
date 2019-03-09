#!/usr/bin/ruby

class HomebrewInstaller
    def run
        system('/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"')
    end

    def should_run
        return `which brew`.to_s.empty?
    end

   def undo
       system('/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/uninstall)"')
   end
end
