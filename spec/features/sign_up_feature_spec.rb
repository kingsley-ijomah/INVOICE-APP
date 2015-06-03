require "rails_helper"

feature "User creates account" do
  background do
    logout
  end

  scenario "with valid data" do
    visit new_user_registration_path

    within "#new_user" do
      select Company.first.name, from: "user_company_id"
      fill_in 'user_name', with: 'kingsley'
      fill_in 'user_email', with: 'kingsley3@test.com'
      fill_in 'user_password', with: 'thisisthetestsubmit'
      fill_in 'user_password_confirmation', with: 'thisisthetestsubmit'
    end
    click_button 'Sign up'

    expect(current_path).to eq(root_path)
    expect(page.find('.notice')).to have_content('Welcome! You have signed up successfully.')
  end

  scenario 'click Login in' do 
    visit new_user_registration_path
    click_link 'Log in'
    expect(current_path).to eq(new_user_session_path)
  end
end
