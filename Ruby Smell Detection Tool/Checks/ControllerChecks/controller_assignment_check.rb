require 'Checks/inc/assignments_check'

# controller assignments check
# inherits main implementation from AssignmentsCheck 
class ControllerAssignmentCheck < AssignmentsCheck

  # override array to only check for specific nodes 
  def interesting_nodes
    @interested_in = [:lasgn]
  end
  
end