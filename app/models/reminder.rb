class Reminder < ActiveRecord::Base
validates :description, presence: true, length: { maximum: 160 }
validates :dispatch_time, presence: true
#validates :user, presence: true
#validates_presence_of :datetime

belongs_to :user

DAYS = [['Sunday', 0], ['Monday', 1], ['Tuesday', 2], ['Wednesday', 3], ['Thursday', 4], ['Friday', 5], ['Saturday', 6]]



  def send_text_message
    client_number = "5088133898" #"self.user.phone"

    twilio_sid = ENV["TWILIO_SID"]
    twilio_token = ENV["TWILIO_TOKEN"]
    twilio_phone_number = "+17745653775"

    @twilio_client = Twilio::REST::Client.new(twilio_sid, twilio_token)

    @twilio_client.account.sms.messages.create(
      :from => "+1#{twilio_phone_number}",
      :to => client_number,
      :body => "Yay! Your are ready for their stretch reminders!")
    end

  end



