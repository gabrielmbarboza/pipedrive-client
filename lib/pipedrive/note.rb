module Pipedrive
  class Note < Base
    class << self
      def all(opts = {})
        get "/notes"
      end

      def find(id)
        res = get "/notes/#{id}"
        new(res.parsed_response)
      end

      def add(opts = {})
        res = post "/notes", body: opts
        new(res.parsed_response)
      end

      def update(opts = {})
        put "/notes", body: opts
      end

      def delete(id)
        delete "/notes/#{id}"
      end
    end
  end
end
