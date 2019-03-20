class Command
    def initialize(command, value, original_value)
        @command = command
        @value = value
        @original_value = original_value
    end
    
    def run
        `#{@command} #{@value}`
    end

    def undo
        `#command #original_value`
    end
end