# Arithmetic options module
# TODO needed?!?!
module Arithmetic_Checker
    
  # BRANCHES = [:if, :else, :while, :until, :for, :rescue, :case, :when, :and, :or]
  #BRANCHES = [:vcall, :call]
  # CONDITIONS = [:and, :or]
  #CONDITIONS = [:==, :<=, :>=, :<, :>]
  #  =  *=  /=  %=  +=  <<=  >>=  &=  |=  ^=
  #OPERATORS = [:*, :/, :%, :+, :<<, :>>, :&, :|, :^, :-]
  OPERATORS = [:*, :/, :%, :+, :^, :-]
  
  def computation_check(node)    
    
    #old
    #search = /@*[a-zA-Z0-9]+\s*[+|-|*|%]\s*\(*@*[a-zA-Z0-9]+\)*/;     
    #if search.match(node)
    #  true
    #else false
    #end
  
    # NEW
    if OPERATORS.include? node[2]      
      return true
    end
    
    return false
    
  end
  
  def operators
        
  end
  
end