$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'globelabs/charging'
require 'webmock/rspec'

HOST = 'https://devapi.globelabs.com.ph'

def stub_post path
  stub_request(:post, HOST + path)
end

def a_post path
  a_request(:post, HOST + path)
end
