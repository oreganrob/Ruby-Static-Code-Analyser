require 'Checks/ViewChecks/view_check'

# checks for the creatio of objects in views
class ViewInstantiationCheck < ViewCheck
  
  def evaluate(node, callback)
    if node[2].eql?(:new)
      callback.call(node.file, node.line,
        "Object Creation in View")
    end
  end
  
  # specify nodes of interest to this check
  def interesting_nodes
    @interested_in = [:call]
  end
end