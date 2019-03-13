#!/usr/bin/ruby

class XCodeInstaller

    def run
        `open -a "/Applications/App Store.app/" https://itunes.apple.com/us/app/xcode/id497799835?mt=12`
    end

    def should_run
        return `ls /Applications | grep -i xcode`.to_s.empty?
    end

    def undo
    end
    
end

# Copy stored keybindings to ~/Library/Developer/Xcode/UserData/KeyBindings
require "FileUtils"

class XCodeKeyBindings

    def run
        FileUtils.copy_file(dotfiles_keybindings, xcode_keybindings)
    end

    private def dotfiles_keybindings
        return File.expand_path('~/.dotfiles/xcode/Default.idekeybindings')
    end


    def should_run
        return File.directory?(key_bindings_directory)
    end

    def undo
        File.delete(xcode_keybindings)
    end

    private def xcode_keybindings
        return "#{key_bindings_directory}/Default.idekeybindings"
    end

    private def key_bindings_directory
        File.expand_path('~/Library/Developer/Xcode/UserData/KeyBindings')
    end

end
