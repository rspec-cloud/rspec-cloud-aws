require 'spec_helper'

VCR.use_cassette('ec2/key-pair') do
  describe KeyPair 'test' do
    its(:key_fingerprint) { should match(/([a-f0-9]{2}:){15}([a-f0-9]{2})/) }
    its(:key_name) { should be_equal_to 'test' }
  end
end
