require 'spec_helper'

describe Globelabs::Charging do
  subject { Globelabs::Charging.new }
  let(:access_token) { 'xwoierwkejrowerwlerjwer' }
  let(:options) {
    {
      amount: 1.00,
      description: 'hello',
      msisdn: '091500000000',
      reference_code: '13420000001',
      access_token: access_token
    }
  }

  let(:body) {
    {
      amount: '1.0',
      description: 'hello',
      endUserId: '091500000000',
      referenceCode: '13420000001',
      transactionOperationStatus: 'Charged'
    }
  }

  before do
    stub_post("/payment/v1/transactions/amount?access_token=#{access_token}").
    with(body: body, headers: { content_type: 'application/x-www-form-urlencoded'}).
    to_return(status: 200, body: '')
  end

  describe '#initialize' do
    it 'setup a connection' do
      expect(subject.connection).to be_an_instance_of Globelabs::Connection
    end
  end

  describe '#charge_to' do
    it 'charge amount to subscriber' do
      subject.charge_to options
      expect(a_post("/payment/v1/transactions/amount?access_token=#{access_token}")
      .with(body: body)).to have_been_made
    end
  end
end
