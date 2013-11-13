class User < ActiveRecord::Base
  validates_presence_of :name
  validates :name, length: { maximum: 30 }
  validates :phone_number, presence: true, uniqueness: true, length: { is: 10 }
  has_many :reminders

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
 

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

