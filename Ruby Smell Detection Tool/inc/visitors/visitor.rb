# all concrete visitor classes extend this class and inherit functionality

require 'inc/error'

# visitor class
class Visitor
    
  def initialize
    load_checks
    @errors = Array.new
  end
  
  # override this method to define smell checks that are loaded...
  # ...for each visitor type that is created
  def load_checks
  
  end

  # method that is called when a code smell is detected
  def add_error(file, line, error)
    @errors << Error.new(file, line, error)
  end
  
  # actual visit method
  def visit(node)

    # send node to each check, along with a callback method...
    # ...to call if a code smell is detected
    @checks.each do |check|
      if check.interested_in node
        check.evaluate(node, method(:add_error)) unless @checks.nil?      
      end
    end

    # recurse through child nodes of this node
    # TODO move check on type to Sexp class?
    # i.e. Sexp class returns its Sexp child nodes
    node.has_child_nodes.each do |child| 
      if child.kind_of?(Sexp)
        child.accept(self)
      end
    end
  end
  
end