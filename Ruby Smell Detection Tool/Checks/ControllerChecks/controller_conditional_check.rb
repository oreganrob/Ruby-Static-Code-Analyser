require 'Checks/ControllerChecks/controller_check'

# TODO check for switch statements etc?
# Check for various Conditional statements in Controllers
class ControllerConditionalCheck < ControllerCheck
  
  def initialize
    super
    @counter = 0;    
  end
  
  def evaluate(node, callback)    
    
    # get count of if statements
    count_method_ifs(node)    
    if @counter >= 2
      callback.call(node.file, node.line, 
        "More than One If in Controller Method in "+
        "Method Starting on Line #{node.line} - #{@counter}")
    end
    @counter = 0;
    
  end
  
  # counts number of if statements in a methods implementation
  def count_method_ifs(node)
    
    # TODO duplicating code from visitor class!
    node.has_child_nodes.each do |child|
      if child.eql? :if
        @counter += 1        
      elsif child.kind_of?(Sexp)   
        count_method_ifs(child)
      end
    end
    
  end
  
  # specify interesting nodes for this smell check
  def interesting_nodes
    @interested_in = [:defn]
  end

end