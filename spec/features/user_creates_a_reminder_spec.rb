require 'spec_helper'

feature "user creates a new reminder", %Q{
  as a a user 
  I want to create a new reminder
  So I can be reminded when to stretch
} do

scenario "user enters valid information" do 
  user = FactoryGirl.create(:user)
  prev_count = user.reminders.count

  visit new_user_session_path
  fill_in "Email", with: user.email
  fill_in "Password", with: user.password
  click_button "Sign in"
  
  visit new_reminder_path

  fill_in 'Description', with: 'Did you stretch today?'
  fill_in 'DateTime', with: 'Wednesday'
  click_button "Create Reminder"

  expect(page).to have_content("Did you stretch today?")
  expect(user.reminders.count).to eql(prev_count + 1)
  end
end