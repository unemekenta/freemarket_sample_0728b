module OmniauthMocks
  def facebook_mock
    OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new(
      {
        provider: 'facebook',
        uid: '1234567',
        info: {
          name: 'mockuser',
          email: 'sample@test.com'
        },
        credentials: {
          token: 'hogehoge'
        },
        extra: {
          raw_info: {
            name: 'hoge User',
            id: '1234567',
            email: 'sample@test.com',
            name: 'mockuser'
          }
        }
      }
    )
  end
end
