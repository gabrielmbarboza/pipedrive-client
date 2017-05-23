module Pipedrive
  class Person < Base
    class << self
      def all(opts = {})
        res = get "/persons"
        normalize_response(res).collect { |person| new(person) }
      end

      def find(id)
        res = get "/persons/#{id}"
        new(res.parsed_response)
      end

      def add(opts = {})
        res = post "/persons", body: opts
        new(res.parsed_response)
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

      def find_by_name(name, opts = {})
        res = get "/persons/find", query: {term: name}.merge!(opts)
        new(res.parsed_response)
      end

      def find_by_email(email)
        email_pattern = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/

        if email.nil? || email.empty?
          raise "Email address can not be blank."
        end

        unless email_pattern.match(email)
          raise "Email address invalid."
        end

        user_email = email.split("@").first

        res = get "/persons/find", query: {term: user_email}
        
        data = res["data"]

        if (data && data.size > 1 )
          res["data"] = data.collect { |person|
            if person["email"] == email then person end
          }
        end
        
        new(res.parsed_response)
      end
    end
  end
end
