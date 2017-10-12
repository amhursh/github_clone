class GithubService

  def initialize(user)
    @conn = Faraday.new(url: 'https://api.github.com/') do |faraday|
      faraday.headers['Authorization'] = "token #{user.token}"
      faraday.adapter Faraday.default_adapter
    end
  end

  def get_basic_info
    response = conn.get('/user')
    JSON.parse(response.body, symbolize_names: true)
  end

  def get_starred_repos_count
    response = conn.get('/user/starred')
    JSON.parse(response.body, symbolize_names: true).count
  end

  private

    attr_reader :conn

end