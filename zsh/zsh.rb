#!/usr/bin/ruby

require './util/copy.rb'
require './util/directory.rb'

def oh_my_zsh_dir
    File.expand_path('~/.oh-my-zsh')
end

class EnableZsh
    def run
        system("chsh -s /bin/zsh")
    end

    def should_run
        return !`which zsh`.to_s.empty? && `echo $ZSH_VERSION`.to_s.empty?
    end

    def undo
        system("chsh -s /bin/bash")
    end
    
end

class EnableOhMyZsh
    def run
        system('sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"')
    end

    def should_run
        return !File.exists?(oh_my_zsh_dir)
    end

    def undo
        system('sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/uninstall.sh)"')
    end
end

class Powerlevel9kInstaller
    def run
        `git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k`
    end

    def should_run
        return File.exists?(oh_my_zsh_dir) && !File.exists?("#{oh_my_zsh_dir}/custom/themes/powerlevel9k")
    end

    def undo
        `rm -r ~/.oh-my-zsh/custom/themes/powerlevel9k`
    end
end

class CopyZshrc

    def initialize
        zshrc = Copy.new("#{dot_directory()}/zsh/.zshrc", '~/.zshrc')

        @copies = [
            zshrc,
        ]
    end

    def run
        @copies.each { |copy| copy.run}
        "cp -r #{dot_directory()}/zsh/custom/ ~/.oh-my-zsh/custom/"
    end

    def should_run
        true
    end
    
    def undo
        @copies.each { |copy| copy.undo}
    end
end