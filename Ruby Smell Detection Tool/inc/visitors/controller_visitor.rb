require 'inc/visitors/visitor'

# Visitor for AST Nodes (ruby Classes)
class ControllerVisitor < Visitor
  
  def load_checks
    # add enabled checks here
    # sort out the checks based on what type of file they are interested in
    # i.e. which checks for controllers, models, views etc...    
    @checks = Array.new
    @checks << ControllerMethodNameCheck.new
    @checks << ControllerHTMLCheck.new
    @checks << ControllerArithmeticCheck.new
    @checks << ControllerLoopCheck.new
    @checks << ControllerLineCountCheck.new
    @checks << ControllerFindCheck.new
    @checks << ControllerAssignmentCheck.new
    @checks << ControllerConditionalCheck.new
    @checks << SQLInjectionCheck.new
    @checks << NestingCheck.new
    @checks << ControllerValidationCheck.new
    @checks << ControllerEchoCheck.new
    
    # only run appropriate checks for file type
    #if(MethodNameCheck.new.is_a? ControllerCheck)
    # puts "CONTROLLER CHECK"
    #end
    
  end  
  
end