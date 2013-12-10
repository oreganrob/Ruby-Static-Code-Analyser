require 'find'

# class containing various file and directory options

# declare file type constants
RB_FILE = ".rb"
ERB_FILE = ".erb"

class FileOptions 
  
  # finds files in a directory
  def find_files(dir)    
    files = Array.new    
    Find.find(dir) do |path|
        if FileTest.directory?(path)      
          next      
        else
          files << path
        end
    end    
    return files
  end
  
  # returns file type based on file extension
  def file_type(filename)      
    if /[^\.]*\.rb/.match(filename)
      return RB_FILE
    elsif /[^\.]*\.erb/.match(filename)
      return ERB_FILE
    elsif /[^\.]*\.rhtml/.match(filename)
      return ERB_FILE
    end  
  end
  
end