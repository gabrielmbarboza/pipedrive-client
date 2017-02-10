module Pipedrive
  class Deal < Base
    class << self
      def all(opts = {})
        get "/deals", body: opts
      end

      def find(id)
        get "/deals/#{id}"
      end

      def add(opts = {})
        post "/deals", body: opts
      end

      def update(opts = {})
        put "/deals", body: opts
      end

      def delete(id)
        delete "/deals/#{id}"
      end
    end
  end
end
