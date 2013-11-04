require 'spec_helper'

feature 'user signs up', %Q{
  as a user 
  I would like to sign up
  so I can use the site
} do

  scenario 'user enters valid informaiton' do
  visit new_user_registration_path 
  fill_in 'Username', with: 'zombie1984'
  fill_in 'Email', with: 'zombie@example.com'
  fill_in 'user_password', with: 'password'
  fill_in 'Password confirmation', with: 'password'
  click_button 'Sign up'

  expect(page).to have_content "Welcome! You have signed up successfully."
  expect(page).to have_content "Sign Out"

  end 
  scenario 'required information is not valid' do
    visit root_path
    click_link 'Sign Up'
    click_button 'Sign up'

    expect(page).to have_content("can't be blank")
    expect(page).to_not have_content("Sign Out")
  end
  scenario 'password confirmation does not match confirmation' do
    visit root_path
    click_link 'Sign Up'
   

    fill_in 'user_password', with: 'password'
    fill_in 'Password confirmation', with: 'soemthingDifferent'
    click_button 'Sign up'
    expect(page).to have_content("doesn't match")
    expect(page).to_not have_content("Sign Out")
end
end