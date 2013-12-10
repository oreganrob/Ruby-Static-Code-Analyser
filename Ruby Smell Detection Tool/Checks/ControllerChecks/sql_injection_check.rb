require 'Checks/ControllerChecks/controller_check'

# security check. check for possible SQL injection loopholes
class SQLInjectionCheck < ControllerCheck
  
  def evaluate(node, callback)
    if node[0].eql?(:call) && node[2].eql?(:find)
      check_query_parameters(node[3], callback)
    end
  end
    
  # recurse through nodes checking parameters
  def check_query_parameters(node, callback)
    node.has_child_nodes.each do |child| 
      if child.eql?(:evstr)
        callback.call(node.file, node.line,
          "Possible SQL Injection Issue in Find")
      elsif child.kind_of?(Sexp)   
        check_query_parameters(child, callback)
      end
    end
  end
  
end