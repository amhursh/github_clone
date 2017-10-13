require 'rails_helper'

feature "User can view list of repos" do

  before do
    stub_omniauth
  end

  scenario "and can view repo info" do
    VCR.use_cassette("user_views_repos_feed") do

      visit '/'

      click_on 'Login with Github'

      expect(current_path). to eq dashboard_path

      expect(page).to have_content "Repositories (29)"
      expect(page).to have_css '.repo_feed'
      expect(page).to have_css('.repo', count: 29)
      expect(page).to have_content "Ruby"
      expect(page).to have_content "amhursh/music_shop"
      expect(page).to have_content "amhursh/job-tracker-base"
    end
  end

end
