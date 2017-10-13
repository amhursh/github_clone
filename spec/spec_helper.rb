RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
end

def stub_omniauth
  OmniAuth.config.test_mode = true

  OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new({
    provider: "github",
    uid: "123456789",
    info: {
      nickname: 'amhursh',
      email: 'aaron@aaron.com',
      image: 'https://avatars3.githubusercontent.com/u/28369772?v=4&s=400&u=674527e9a3d370b5978288d2a23b9e33dbfc4f22'
    },
    credentials: {
      token: ENV["USER_TOKEN"]
    }
    })
end
