require 'rails_helper'

feature "User can log in with Github" do

  before do
    stub_omniauth
  end

  scenario "and see profile page" do
    VCR.use_cassette("user_logs_in") do
      visit root_path

      click_on "Login with Github"

      expect(current_path).to eq dashboard_path
      expect(page).to have_content 'amhursh'
      expect(page).to have_link 'Logout'
      expect(page).to_not have_content 'Login with Github'
    end
  end

  scenario "and can log out" do
    VCR.use_cassette("user_logs_out") do
      visit root_path

      click_on "Login with Github"

      click_on "Logout"

      expect(page).to_not have_content "amhursh"
      expect(page).to_not have_content "Logout"
      expect(page).to have_content "Login with Github"
    end
  end

end
