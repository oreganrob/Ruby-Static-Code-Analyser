require 'Checks/check'

# looks for variable assignments
class AssignmentsCheck < Check
  
  # include :<<  for assigning to arrays?
  @@bad_types = [:lvar, :ivar, :str, :lit]
  
  def evaluate(node, callback)
        
    if(found_var_assignment(node))
      callback.call(node.file, node.line,
        "Found Smelly Variable Assignments (#{node[0]}, "+
        "#{node[1]} = #{assigned_type(node[2])}) ")
    end
    
  end
  
  # moved check to seperate method to make it more readable above
  def found_var_assignment(node)
    if(@@bad_types.include?(assigned_type(node[2])) && !node[1].eql?(:_buf))
      true
    else false
    end
  end
  
  # returns assigned type
  def assigned_type(node)
    if defined? node[0]
      return node[0]
    else return nil
    end
  end
  
  # specify nodes of interest to this smell check
  def interesting_nodes
    @interested_in = [:attrasgn, :attrset, :dasgn_curr, :iasgn, :lasgn, :masgn]
  end
  
end