require 'Checks/check'
require 'Modules/arithmetic_module'

# looks for elementary arithmetic operations
class ArithmeticCheck < Check
  
  # include arithmetic module
  include Arithmetic_Checker

  def evaluate(node, callback)
    if self.computation_check(node)
      callback.call(node.file, node.line,
        "Found Computations(Operator: #{node[2]}) ")
    end
  end
  
  # specify nodes of interest to this check
  def interesting_nodes
    @interested_in = [:call]
  end
  
end