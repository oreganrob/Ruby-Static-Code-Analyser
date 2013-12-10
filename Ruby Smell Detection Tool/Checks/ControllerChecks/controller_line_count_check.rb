require 'Checks/ControllerChecks/controller_check'

# Controller method should be skinny. Check the method line counts
class ControllerLineCountCheck < ControllerCheck
  
  MAX_LINES = 12
  
  # entry point for check
  def evaluate(node, callback)
    
    line_count = node.last.line - node.line
    if(line_count > MAX_LINES)
      callback.call(node.file, node.line,
        "Too Many Lines in #{node[1]} Method - Lines: #{line_count}")
    end
    
  end
  
  # specify interesting nodes for this check
  def interesting_nodes
    @interested_in = [:defn]
  end
  
end