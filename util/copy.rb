require 'yaml'

class Copy
    def initialize(source, destination = "")
        @source = source
        @destination = destination
    end

    private def replace_env_variables
        userConfig = YAML::load_file('./config/user.yml')
        fileData = File.read(@source)

        userConfig.each do |key, value|
            fileData = fileData.gsub("{#{key}}", "#{value}")
        end      

        puts fileData
        File.open("./build/#{@source}", 'w') do |out|
            out << fileData
        end  
    end

    def make_build_dir()
        directory_name = "build"
        Dir.mkdir(directory_name) unless File.exists?(directory_name)
    end
    
    def run
        make_build_dir()
        replace_env_variables()
        `cp ./build/#{@source} #{@destination}`
    end

    def undo
        # Do this
    end
end