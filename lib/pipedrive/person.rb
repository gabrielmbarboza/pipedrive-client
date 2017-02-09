require "httparty"

module Pipedrive

  class Person < Base
    class << self
      def all(opts = {})
        get("/persons")
      end

      def find(id)
        get "/persons/#{id}"
      end
    end
  end
end
