require 'Checks/ControllerChecks/controller_check'
require 'Modules/html_module'

# looks for any HTML that is declared in Controller variables
class ControllerHTMLCheck < ControllerCheck

  # include the HTML regex module
  include HTML_Checker

  # entry point for smell check 
  def evaluate(node, callback)    
          
    if self.look_for_html(node[1])
      callback.call(node.file, node.line,
        "Found HTML in Controller")
    end
    
  end
  
  # specify nodes of interest to this smell check
  def interesting_nodes
    @interested_in = [:str]
  end
  
end