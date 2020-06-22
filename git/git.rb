require './util/command.rb'

class GitConfigs

    def run
        `cp #{dotfiles_dir}/git/.gitconfig ~/`
    end

    def should_run
        true
    end
    
    def undo
        `rm ~/.gitconfig`
    end
end

def dotfiles_dir
    File.expand_path('~/.dotfiles')
end