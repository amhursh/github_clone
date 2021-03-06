require "rails_helper"

feature "User can view list of following users" do

  before do
    stub_omniauth
  end

  scenario "and can see summary of past activity" do
    VCR.use_cassette("user_views_recent_following_commits_feed") do

      visit '/'

      click_on 'Login with Github'

      expect(current_path). to eq dashboard_path

      expect(page).to have_css '.following_commit_feed'
      expect(page).to have_css('.following_commit', count: 9)
    end
  end

end
