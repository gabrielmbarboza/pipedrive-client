module Pipedrive
  class Person < Base
    def self.all(opts = {})
      get('/persons')
    end
  end
end
