# base smell class
class Check

  # constructor - if this is overridden in a smell class
  # then that smell class must call 'super'. otherwise
  # the 'interesting_nodes' array will not be inited
  def initialize 
    interesting_nodes
  end

  # this method is checked against each node to see 
  # if the smell checker is interested in the node.
  # this method should not be overriden 
  def interested_in(node)
    # default to true to register interest in all nodes    
    if(@interested_in.include?(node[0]) || @interested_in.size == 0)
      return true
    end
    return false
  end
  
  # override this method and add smell check logic
  def evaluate(node, callback)    
    
  end
  
  # override this method in each smell class
  # to define what nodes it is interested in
  def interesting_nodes
    @interested_in = []
  end
  
end