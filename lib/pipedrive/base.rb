require "httparty"
require "ostruct"

module Pipedrive

  HEADERS = {
   "User-Agent"    => "Ruby.Pipedrive.Api",
   "Accept"        => "application/json",
   "Content-Type"  => "application/x-www-form-urlencoded"
  }

  class Base < OpenStruct
    include HTTParty

    base_uri "https://api.pipedrive.com/v1"
    headers HEADERS
    format :json

    class << self
      def login(email, password)
        token = get('/authorizations')
        default_params api_token: token
      end

      def authenticate(token)
        default_params api_token: token
      end
    end
  end
end
