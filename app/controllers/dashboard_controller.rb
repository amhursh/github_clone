class DashboardController < ApplicationController

  def index
    @user = current_user
    @basic_info = GithubService.new(@user).get_basic_info
    @starred_count = GithubService.new(@user).get_starred_repos_count
  end

end