class RemindersController < ApplicationController
  def index
    @reminders = Reminder.all
    @reminders = Reminder.where(user_id: current_user.id).sort_by(&:id  && :state)
  end
  def new 
    @reminder = Reminder.new
  end  
 
   def create
    if current_user.unverified?
       redirect_to dashboard_path
       flash[:notice] = "Your account has not been verified. Please verify."
    elsif current_user.prompts.where(state: "active").count == 3
      redirect_to dashboard_path
      flash[:notice] = "You have reached your maximum number of active reminders"
    elsif current_user.verified?
      @reminder = current_user.prompts.build(prompt_params)
      @reminder.day_list = params[:prompt][:days]
      if @reminder.save
        redirect_to dashboard_path
    else
        redirect_to dashboard_path
        flash[:notice] = "Reminder message cannot be blank and must be under 160 characters"
    end
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
  def reminder_params
    params.require(:reminder).permit(:description, :dispatch_time, :days)

   end
end

