require "httparty"

module Pipedrive
  class Base < OpenStruct
    include HTTParty
    base_uri "https://api.pipedrive.com/v1"
  end
end
