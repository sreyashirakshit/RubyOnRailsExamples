require 'rails_helper'

RSpec.feature "Users", type: :feature do
    
    context 'create new user' do
        before(:each) do
            visit new_user_path
            within('form') do
                fill_in 'First name', with: 'john'
                fill_in 'Last name', with: 'doe'

            end
        end
            
        scenario "should be successful" do
        within('form') do
            fill_in 'Email', with: 'john.doe@example.com'
        end
            click_button 'Create User'
            expect(page).to have_content('User was successfully created')
        end
        
        scenario "should fail" do
            click_button 'Create User'
            expect(page).to have_content('Email')
        end
    end
    
    context 'update user' do
        let!(:user) {User.create(first_name: 'John', last_name: 'Doe', email: 'john.doe@example.com')}
        before(:each) do
            visit edit_user_path(user)
        end
        scenario "should be successful" do
            within("form") do
                fill_in 'First name', with: 'Jane'
                fill_in 'Email', with: 'jane.doe@example.com'
            end
            click_button 'Update User'
            expect(page).to have_content 'User was successfully updated'
            expect(page).to have_content 'jane.doe@example.com'
        end
        
        scenario "should fail" do
            within("form") do
                fill_in 'First name', with: ''
            end
            click_button 'Update User'
            expect(page).to have_content 'First name'
        end

    end
    
    context 'delete user' do
        scenario "should be successful" do
         User.create(first_name: 'John', last_name: 'Doe', email: 'john.doe@example.com')
         visit users_path
         click_link 'Destroy',match: :first
         expect(page).to have_content 'User was successfully deleted'
        end
    end
  
end
