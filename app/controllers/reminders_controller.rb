class RemindersController < ApplicationController
  def index
    @reminders = Reminder.all
    #@reminders = Reminder.where(user_id: current_user.id).sort_by(&:id  && :state)
  end
  def new 
    @reminder = Reminder.new
  end  
 
    def create
     @reminder = Reminder.new(reminder_params)
     if @reminder.save
        flash[:notice] = "Reminder was succesfully saved!"
        redirect_to new_reminder_path
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
    params.require(:reminder).permit(:description, :dispatch_time, :days)

   end
end

