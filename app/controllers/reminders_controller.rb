class RemindersController < ApplicationController
  def index
    @reminders = Reminder.all
    @reminders = Reminder.where(user_id: current_user.id).sort_by(&:id  && :state)
  end
  def new 
    @reminder = Reminder.new
  end  
  def show
    @reminder = Reminder.all
  end

   def create
  #   if current_user.unverified?
      redirect_to new_user_session_path
  #     flash[:notice] = "Your account has not been verified. Please verify."
  #   elsif current_user.prompts.where(state: "active").count == 3
  #     redirect_to new_user_path
  #     flash[:notice] = "You have reached your maximum number of active reminders"
  #   elsif current_user.verified?
  #     @reminder = current_user.prompts.build(prompt_params)
  #     @reminder.day_list = params[:prompt][:days]
  #     if @reminder.save
  #       redirect_to root_path
  #   else
  #       redirect_to root_path
  #       flash[:notice] = "Reminder message cannot be blank and must be under 200 characters"
    end
  # end
  def reminder_params
    params.require(:reminder).permit(:description, :dispatch_time)

   end
end

