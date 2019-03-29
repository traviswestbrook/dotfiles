#!/usr/bin/ruby

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
        ` git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k`
    end

    def should_run
        return File.exists?(oh_my_zsh_dir) && !File.exists?("#{oh_my_zsh_dir}/custom/themes/powerlevel9k")
    end

    def undo
        `rm -r ~/.oh-my-zsh/custom/themes/powerlevel9k`
    end
end

class CopyZshrc
    def run
        `cp ~/.dotfiles/zsh/.zshrc ~/.zshrc`
        `cp -r ~/.dotfiles/zsh/custom/ ~/.oh-my-zsh/custom/`
    end

    def should_run
        return true
    end

    def undo
        `cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc`
    end
end