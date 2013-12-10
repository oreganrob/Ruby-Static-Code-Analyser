require 'Checks/ControllerChecks/controller_check'

# Check for RESTful controller methods
class ControllerMethodNameCheck < ControllerCheck

  VALID_METHODS = [:index, :show, :new, :create, :edit, :update, :destroy]
  MAX_PARAMETER_COUNT = 1;

  # evaluate method. enrty point for Smell Check
  def evaluate(node, callback)            
    self.is_valid_method(node, callback)
    self.check_parameter_count(node, callback)
  end

  # checks method name to see if it is an allowed name
  def is_valid_method(node, callback)
    if(!VALID_METHODS.include?(node[1]))
      callback.call(node.file, node.line, 
        "'#{node[1]}' is not a valid RESTful Controller Method")
    end
  end
  
  # RESTful methods should not have any parameters
  def check_parameter_count(node, callback)
    if node[2].size > MAX_PARAMETER_COUNT
      callback.call(node.file, node.line, 
        "Too many Parameters defined for Method '#{node[1]}"+
        ". #{node[2].size-1} Defined. 0 Allowed")      
    end
  end
  
  # 
  def check_for_respond_to(node, callback)
    # TODO
  end
  
  # defines nodes this smell check is interested in
  def interesting_nodes
    @interested_in = [:defn]
  end

end