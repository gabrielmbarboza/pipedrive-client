module Pipedrive
  class Deal < Base
    class << self
      def all(opts = {})
        get "/deals", query: opts
      end

      def all_persons(opts = {})
        get "/deals/#{id}/persons", body: opts
      end

      def find_by_name(name)
        res = get "/deals", body: {"term": name}
        new(res.parsed_response)
      end

      def find_by_name_and_person(name, person_id)
        res = get "/deals", body: {"term": name, "person_id": person_id}
        new(res.parsed_response)
      end

      def deal_details(id)
        res = get "/deals/#{id}"
        new(res.parsed_response)
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
