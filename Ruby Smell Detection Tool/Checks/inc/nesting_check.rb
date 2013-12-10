require 'Checks/check'

# loks for unnecessary nesting of conditionals etc...
class NestingCheck < Check
  
  # specific node types to lok at
  TYPES = [:if, :for, :while]
  
  def initialize
    super
    @counter = 0;    
  end

  # entry point. count the number of nested instances
  def evaluate(node, callback)
    
    if TYPES.include? node[0]
      @counter += 1
      if node.has_child_nodes
        
        # TODO duplicating code from visitor class!
        node.has_child_nodes.each do |child| 
          if child.kind_of?(Sexp)   
            evaluate(child, callback)
          end
        end
        
        @counter -= 1
      end
      
      if @counter >= 1
        callback.call(node.file, node.line,
          "Code Complexity Detected in Controller. "+
          "Nested Conditionals/Loops")
      end
      
    end    
  end

end