#!/usr/bin/ruby

class EnableZsh
    def run
        system("chsh -s /bin/zsh")
    end

    def should_run
        return !`which zsh`.to_s.empty? && !`echo $ZSH_VERSION`.to_s.empty?
    end

    def undo
        system("chsh -s /bin/bash")
    end
    
end