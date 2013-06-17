require 'aws'
require './generic_workflow.rb'
require './sns_helper.rb'

module SubscriptionWorkflowExample
  # An activity that waits for confirmation of the user's email address.
  class ConfirmEmailActivity < GenericActivity

    # Creates the confirm-user-email activity.
    #
    # @param (see GetSubscriptionInfoActivity)
    #
    def initialize(workflow)
      activity_options = {
        :default_task_heartbeat_timeout => :none,
        :default_task_schedule_to_start_timeout => 60,
        :default_task_schedule_to_close_timeout => 3660,
        :default_task_start_to_close_timeout => 3600}
      super(workflow, 'confirm-user-email', activity_options)
    end

    # Starts an execution of the confirm-user-email activity.
    #
    def run
    end
  end
end
