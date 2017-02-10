module Pipedrive
  class Person < Base
    class << self
      def all(opts = {})
        get "/persons"
      end

      def find(id)
        res = get "/persons/#{id}"
        new(res.parsed_response)
      end

      def add(opts = {})
        post "/persons", body: opts
      end

      def update(id, opts = {})
        put "/persons/#{id}", body: opts
      end

      def delete(id)
        delete "/persons/#{id}"
      end

      def all_deals(id)
        res = get "/persons/#{id}/deals"
        new(res.parsed_response)
      end
    end
  end
end
