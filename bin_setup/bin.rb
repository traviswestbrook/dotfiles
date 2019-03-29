#Runs through all dot files directories and copies anything in bin/ to /usr/local/bin
class BinInstaller
    def run
        bin_dotfiles.each { |filePath|
            `cp #{filePath} /usr/local/bin/`
        }
    end

    def should_run
        return true
    end

   def undo
   bin_dotfiles.map {|filePath| filePath.split('/').last }
        .each { |file|
            `rm /usr/local/bin/#{file}`
        }
   end
end

def bin_dotfiles
    return Dir.glob("#{dotfiles_dir}/**/bin/*")
end

def dotfiles_dir
    File.expand_path('~/.dotfiles')
end