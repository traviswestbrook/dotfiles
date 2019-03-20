require './util/command.rb'

class GitConfigs

    def initialize
        git_branch_page_mode = Command.new("git config --global pager.branch", "false", "true")
        @configs = [
            git_branch_page_mode, 
        ]
    end

    def run
        @configs.each { |config| config.run}
    end

    def should_run
        true
    end
    
    def undo
        @configs.each { |config| config.undo}
    end
end