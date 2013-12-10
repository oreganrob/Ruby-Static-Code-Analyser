require 'Checks/ControllerChecks/controller_check'

# this smell check looks for DB queries
# and suggest replacing them with named scopes on the model
class ControllerFindCheck < ControllerCheck
  
  QUERY_NODES = [:find]
  
  # smell check entry point
  def evaluate(node, callback)
   
   if QUERY_NODES.include?(node[2])
     callback.call(node.file, node.line, 
       "Consider Using a Named Scope in the Model "+
        "for Controller Find")
   end
  end
 
  # specify interesting nodes for this smell check
  def interesting_nodes
    @interested_in = [:call]
  end
  
end