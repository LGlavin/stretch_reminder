class RemindersController < ApplicationController
  def index
    @reminders = Reminder.all
  end
  def new 
    @reminder = Reminder.new
  end  

    def create
     @reminder = Reminder.new(reminder_params)
     if @reminder.save
        @reminder.send_text_message 

        redirect_to reminder_path @reminder
    else
        render :new
    end
   end

  def show
    @reminder = Reminder.find(params[:id])
  end

  def destroy
    @reminder = Reminder.find(params[:id])
    @reminder.destroy
    redirect_to dashboard path 
  end
  
  private
  def reminder_params
    params.require(:reminder).permit(:description, :dispatch_time)

   end
end

