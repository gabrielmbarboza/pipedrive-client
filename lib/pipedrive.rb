require "pipedrive/version"
require 'pipedrive/base'
require 'pipedrive/person'

module Pipedrive
  def self.authenticate(api_token)
    Base.authenticate(api_token)
  end
end
