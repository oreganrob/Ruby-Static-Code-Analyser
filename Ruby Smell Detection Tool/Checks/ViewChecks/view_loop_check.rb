require 'Checks/ViewChecks/view_check'

# Look for bad loops in views. Views shouldn't really contain 
# any loops other than those used to iterate over the results of a query or similar.
# also, when iterating over a queries results you should use 'each' instead of 'for'
class ViewLoopCheck < ViewCheck
  
  BAD_LOOPS = [:for, :while, :until]
  BAD_ITERATORS = [:detect, :times, :upto, :step, :each_index]
  
  def evaluate(node, callback)
    
    if(BAD_LOOPS.include?(node[0]) || BAD_ITERATORS.include?(iterator_type(node[1])))
      callback.call(node.file, node.line,
        "Bad Loop Type in View. Loop: #{node[0]}, "+
        "Type: #{iterator_type(node[1])}")
    end      
    
  end
  
  # check iterator type
  def iterator_type(node)
    return node[2]
  end
  
  # specify nodes of interest to this check
  def interesting_nodes
    @interested_in = [:for, :while, :until, :iter]
  end
  
end