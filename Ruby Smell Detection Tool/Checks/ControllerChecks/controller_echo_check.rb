require 'Checks/ControllerChecks/controller_check'

class ControllerEchoCheck < ControllerCheck
  
  ECHO_TYPES = [:puts, :print]
  
  def evaluate(node, callback)
    
    if ECHO_TYPES.include?(node[2])
      callback.call(node.file, node.line, 
        "Found 'Print' Output (#{node[2]})")
    end
    
  end
  
end