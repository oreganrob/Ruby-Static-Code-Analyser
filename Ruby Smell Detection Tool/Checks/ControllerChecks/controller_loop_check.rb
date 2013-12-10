require 'Checks/ControllerChecks/controller_check'

# this check looks for looping structures in Controller methods
class ControllerLoopCheck < ControllerCheck
    
  BAD_LOOPS = [:for, :while, :until]
  BAD_ITERATORS = [:each, :detect, :times, :upto, :step, :each_index]
  #OK_ITERATORS = [:respond_to, :xml]
  
  # entry point for smell check
  def evaluate(node, callback)
    
    if(BAD_LOOPS.include?(node[0]) || BAD_ITERATORS.include?(iterator_type(node[1])))
      callback.call(node.file, node.line,
        "Loop In Controller. #{node[0]} - Type: "+
        "#{iterator_type(node[1])}")
    end
    
  end
  
  # return iterator type
  def iterator_type(node)
    return node[2]
  end
  
  # specify interesting nodes for this smell check
  def interesting_nodes
    @interested_in = [:for, :while, :until, :iter]
  end
  
end