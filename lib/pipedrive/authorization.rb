module Pipedrive
  class Authorization < Base
    class << self
      def login(email, password)
        token = get('/authorizations')
        default_params = { api_key: token }
      end

      def authenticate(token)
        default_params = { api_key: token }
      end
    end
  end
end
