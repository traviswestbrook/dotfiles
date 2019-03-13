#!/usr/bin/ruby

class VsCodeExtensions

    def initialize
        @extensions = [
            'k--kato.intellij-idea-keybindings',
        ]
    end


    def run
        @extensions.each { |extension| 
            `code --install-extension #{extension}`
        }
    end

    def should_run
        return !`ls /Applications | grep -i "Visual Studio Code.app"`.to_s.empty?
    end

    def undo
        @extensions.each { |extension| 
        `code --uninstall-extension #{extension}`
        }
    end
    
end