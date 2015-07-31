require 'globelabs/charging/version'
require 'globelabs/connection'

module Globelabs
  class Charging
    attr_reader :connection

    def initialize
      @connection = Globelabs::Connection.new
    end

    def charge_to(options = {})
      url = "/payment/v1/transactions/amount?access_token=#{options[:access_token]}"
      connection.post url, {
        amount: options[:amount],
        description: options[:description],
        endUserId: options[:msisdn],
        transactionOperationStatus: :Charged,
        referenceCode: options[:reference_code]
      }
    end
  end
end
