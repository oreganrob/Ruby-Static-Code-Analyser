require 'inc/file_options'

# this class does some of the heavy lifting of the application
# TODO should probably be split up into smaller classes

class Runner
  
  def initialize
    @ff = FileOptions.new
  end
  
  # entry point from project.rb. this method runs the checker
  def run_checker(arg)    

    # check that argument is a directory before proceeding
    if File.directory? arg      
      # look for controllers, models and views directories in the rails app    
      #dirs = [arg+'/app/controllers', arg+'/app/models', arg+'/app/views']
      dirs = [arg+'/app/controllers', arg+'/app/views']
      dirs.each do |dir|       
        # check that each dir exists
        if(File.directory? dir)
          puts "\nExamining '#{dir}'..."
              
          check_files(dir)
        end # if(File.directory? dir)        
      end # dirs.each do |dir|        
    end # if File.directory? arg

  end
  
  # returns list of files in each directory and loop through them
  def get_files(directory)
    @ff.find_files(directory)
  end
  
  # loops through files in directory
  def check_files(dir)
    get_files(dir).each do |file|      
      if(File.exists?(file))
        
        check_file(file)
        #exit
      end # if(File.exists?(file))
    end # files.each do |file| 
  end
  
  # reads and checks file
  def check_file(file)    

    print "\nChecking File > ", file, "...\n"
    
    # read in file contents
    contents = File.read(file)
      
    # get visitor
    visitor = create_visitor(file)           
    if visitor 
      # get AST nodes
      node = get_nodes(file, contents)         
      
      # start visting nodes                  
      node.accept(visitor) if node
    end
    
    puts "Done"
  end
  
  # creates appropriate visitor object
  def create_visitor(file)
    factory = VisitorFactory.new
    factory.create(file)
  end
  
  # parses the source code and returns the AST
  def get_nodes(file, contents)

    # if erb file then extract embedded ruby first using Erubis
    if @ff.file_type(file).eql? ERB_FILE
      contents = Erubis::Eruby.new(contents).src
    end
      
    # create an instance of the ruby parser              
    # and get AST representation of code
    RubyParser.new.parse(contents)  
  end
  
end