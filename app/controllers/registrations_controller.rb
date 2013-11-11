class RegistrationsController < Devise::RegistrationsController
  TWILIO_SID = "AC506e307ffc3df055fac76822556291a6"
  TWILIO_AUTH = "7334a3bab711022df7e5ea9611c925a0"
  TIWLIO_NUMBER = "+17745653775"

  def show
    @registration = Registration.new
  end

  def create
    phone = params[:registration][:phone]
    unless phone 
      redirect_to :action => :show, :error => "Please specify a valid phone number."
    end

    if Registration.create :phone_number => phone_number
      @twilio_client = Twilio::REST::Client.new(
        TWILIO_SID,
        TWILIO_AUTH
      )
 
      @twilio_client.account.sms.messages.create(
        :from => TWILIO_NUMBER,
        :to => "+1#{phone_number}",
        :body => "Thank you for registering. To confirm your subscript reply YES.",
      )
 
      redirect_to :action => :thanks, :notify => "Successfully registered."
    end
  end
 
  def thanks
  end
 end

