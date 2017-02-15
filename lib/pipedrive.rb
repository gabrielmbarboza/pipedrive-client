require "pipedrive/version"
require 'pipedrive/base'
require 'pipedrive/person'
require 'pipedrive/deal'
require 'pipedrive/note'

module Pipedrive
  def self.authenticate(api_token)
    Base.authenticate(api_token)
  end
end
