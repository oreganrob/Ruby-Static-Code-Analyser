# error/smell class. create an instance of this class for each smell found

class Error
  
  attr_accessor :file, :line, :error 
  
  # error is simply printed when created. 
  # can do other things with it in his method if so desired
  def initialize(file, line, error)
    @file = file
    @line = line
    @error = error
    
    print "Code Smell Found => Line: ",
      @line, ", Description: ", @error, "\n"
  end
  
end