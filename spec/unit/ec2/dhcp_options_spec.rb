require 'spec_helper'

VCR.use_cassette('ec2/dhcp-options') do
  describe DhcpOptions 'test' do
    let(:entry_set_1) do
      {
        'domain-name' => ['eu-central-1.compute.internal'],
        'domain-name-servers' => ['AmazonProvidedDNS']
      }
    end

    its(:dhcp_configuration_set) { should == entry_set_1 }

    its(:dhcp_configuration_set) { should have_key('domain-name').with_value(['eu-central-1.compute.internal']) }

    its(:dhcp_configuration_set) { should have_key('domain-name-servers').with_value(['AmazonProvidedDNS']) }

    its(:dhcp_configuration_set) { should have(2).entries }

    its(:id) { should match(/dopt-[a-z0-9]{8}/) }

    its(:tag_set) { should have_key('Name').with_value('test') }

    its(:tag_set) { should have(1).entry }
  end
end
