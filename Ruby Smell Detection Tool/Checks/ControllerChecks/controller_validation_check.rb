require 'Checks/ControllerChecks/controller_check'

# Checks if the developer is trying to do various
# validations in the controller
class ControllerValidationCheck < ControllerCheck
  
  def evaluate(node, callback)
    
    # look for regular expressions. can indicate possible validations  
    if node[2].eql?(:match) || node[0].eql?(:match3)
      callback.call(node.file, node.line,
        "Controller Validation? Found Regex's")
    end
    
    # look for method names containing 'validate'?
    # look for check on object.blank?
    # look for return true/false?
    
  end
  
end