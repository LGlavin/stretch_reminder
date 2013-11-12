# require 'spec_helper'

# describe RegistrationsController do
#   include SmsSpec::Helpers

#   describe "POST 'create'" do
#     it "sends a text message to the phone number that registered" do
#       post 'create', {:phone => '7745653775'}

#       open_last_text_message_for "7745653775"
#       current_text_message.should have_body "Thank you for registering. To confirm reply yes."
#     end
#   end
# end
