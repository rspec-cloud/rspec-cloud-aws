require 'spec_helper'

VCR.use_cassette('ec2/internet-gateway') do
  describe InternetGateway 'test' do
    let(:attachment_set) do
      {
        'state' => 'available',
        'vpcId' => /vpc-[a-z0-9]{8}/
      }
    end

    it { should be_available }

    its(:attachment_set) { should match(attachment_set) }

    its(:id) { should match(/igw-[a-z0-9]{8}/) }

    its(:tag_set) { should have_key('Name').with_value('test') }

    its(:tag_set) { should have(1).entry }

    its(:vpc_id) { should match(/vpc-[a-z0-9]{8}/) }
  end
end
