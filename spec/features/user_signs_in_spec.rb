require 'spec_helper'

feature 'user signs in', %Q{
  As a registered user
  I want to sign in
  so that I can use the website
} do

   scenario 'user signs in with accurate information' do
     user = FactoryGirl.create(:user)
     
     visit root_path
     click_link 'Sign In'
     expect(page).to have_content('Sign In')
     fill_in 'Email', with: user.email
     fill_in 'Password', with: user.password
     
     
     click_button 'Sign in'
     
     expect(page).to have_content('Signed in successfully.')
     expect(page).to have_content('Sign Out')
   end

 end
