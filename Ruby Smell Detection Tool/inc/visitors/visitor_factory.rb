# Visitor Factory
# create appropriate visitor based on file type 

require 'inc/visitors/model_visitor'
require 'inc/visitors/view_visitor'
require 'inc/visitors/controller_visitor'

class VisitorFactory
  
  # create and return appropriate visitor
  def create(filename)    
    
    # get/check file type
    # TODO use switch!
    # TODO use file options class
    if /[^\.]*\.rb/.match(filename)
      ControllerVisitor.new
    elsif /[^\.]*\.erb/.match(filename)
      ViewVisitor.new
    elsif /[^\.]*\.rhtml/.match(filename)
      ViewVisitor.new
    else puts "Unknown File Type"
    end
  end
   
end 