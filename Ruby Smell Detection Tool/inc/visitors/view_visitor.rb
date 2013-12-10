require 'inc/visitors/visitor'

# Visitor for views
class ViewVisitor < Visitor
  
  def load_checks
    @checks = Array.new
    @checks << ViewArithmeticCheck.new
    @checks << ViewAssignmentsCheck.new
    @checks << ViewQueryCheck.new
    @checks << NestingCheck.new
    @checks << ViewInstantiationCheck.new
    @checks << ViewLoopCheck.new
  end
  
end