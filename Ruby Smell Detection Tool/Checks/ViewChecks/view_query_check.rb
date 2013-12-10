require 'Checks/ViewChecks/view_check'

# view query check
# looks for queries that are done directly from the view
class ViewQueryCheck < ViewCheck
  
  #QUERY_NODES = [:find, :all, :first, :last]
  QUERY_NODES = [:find]

  def evaluate(node, callback)
    if QUERY_NODES.include?(node[2])
      callback.call(node.file, node.line,
        "Found Query in View - #{node[2]}")
    end
  end
  
  # specify nodes of interest to this check
  def interesting_nodes
    @interested_in = [:call]
  end

end