#
# An example of a site registration routine, presented in episodic format.
#
# by Eron Hennessey <eron@abstrys.com>
#
# This episode: the console helper!
#
module RegistrationExample

  # Functions for handling console input/output for the registration workflow example
  module ConsoleHelper

    # Prompts the user for input, confirming the choice by printing it back to the user and asking for a Yes/No (Y/N)
    # response. If the user responds with anything other than 'y' or 'Y', the prompt will be displayed again and the
    # user can re-enter the input.
    #
    # If the user wants to exit the prompt without providing input, he or she can type ':exit' at the prompt and exit
    # input.
    #
    # @param [String] prompt_text
    #   The text that will be used to prompt the user. If *prompt_text* set to "Name", for instance, the prompt before
    #   user input will be "Name: ". If *prompt_text* is not set, then a simple colon ':' will be the prompt.
    #
    # @return [String]
    #   The the text that was entered (and agreed upon), or `nil` if the user exited.
    #
    def self.prompt_with_confirmation(prompt_text = "")
      confirmed = :false
      user_text = nil
      while confirmed == :false

        # get the user's input for the field.
        print "#{prompt_text}: "
        user_text = gets.strip

        # if the user types ':exit', exit and return nil.
        if user_text == ':exit'
          return nil
        end

        # confirm the choice.
        puts "You entered: #{user_text}"
        print "Use this value? (y/n): "
        confirmation = gets.strip.downcase
        if confirmation == 'y'
          confirmed = :true
        else
          if confirmation.start_with?("y")
            puts "You can enter only 'y' or 'Y' to confirm your choice."
            puts "Extra characters in the response aren't recognized."
          else
            puts "Please re-enter your input, or type ':exit' to cancel input."
          end
        end
      end
      return user_text
    end # prompt_with_confirmation
  end # ConsoleHelper

  # Tests the ConsoleHelper module
  def self.test_console_helper
    puts "What is your favorite fruit?"
    fruit_name = ConsoleHelper.prompt_with_confirmation("Fruit name")
    if fruit_name != nil
      puts "Looks like *you* like #{fruit_name}s!"
    else
      puts "Hrrumph. You don't want to play?"
    end
  end # test_console_helper

end # RegistrationExample

# If you uncomment the following line, and this script is executed, it will run the test.
#RegistrationExample.test_console_helper
