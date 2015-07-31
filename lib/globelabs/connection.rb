require 'faraday'

module Globelabs
  class Connection < Faraday::Connection
    def initialize
      super 'https://devapi.globelabs.com.ph'
    end
  end
end
