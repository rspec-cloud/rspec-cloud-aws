require 'spec_helper'

VCR.use_cassette('ec2/network-acl') do
  describe NetworkAcl 'test' do
    let(:association_set) do
      [
        {
          'networkAclAssociationId' => /aclassoc-[a-z0-9]{8}/,
          'networkAclId' => /acl-[a-z0-9]{8}/,
          'subnetId' => /subnet-[a-z0-9]{8}/
        },
        {
          'networkAclAssociationId' => /aclassoc-[a-z0-9]{8}/,
          'networkAclId' => /acl-[a-z0-9]{8}/,
          'subnetId' => /subnet-[a-z0-9]{8}/
        }
      ]
    end

    let(:entry_set) do
      [
        {
          'cidrBlock' => '0.0.0.0/0',
          'egress' => true,
          'icmpTypeCode' => {},
          'portRange' => {},
          'protocol' => -1,
          'ruleAction' => 'allow',
          'ruleNumber' => 100
        },
        {
          'cidrBlock' => '0.0.0.0/0',
          'egress' => true,
          'icmpTypeCode' => {},
          'portRange' => {},
          'protocol' => -1,
          'ruleAction' => 'deny',
          'ruleNumber' => 32_767
        },
        {
          'cidrBlock' => '0.0.0.0/0',
          'egress' => false,
          'icmpTypeCode' => {},
          'portRange' => {},
          'protocol' => -1,
          'ruleAction' => 'allow',
          'ruleNumber' => 100
        },
        {
          'cidrBlock' => '0.0.0.0/0',
          'egress' => false,
          'icmpTypeCode' => {},
          'portRange' => {},
          'protocol' => -1,
          'ruleAction' => 'deny',
          'ruleNumber' => 32_767
        }
      ]
    end

    its(:association_set) { should have(2).entries }

    its(:association_set) { should match(association_set) }

    it { should be_default }

    its(:entry_set) { should match(entry_set) }

    its(:entry_set) { should have(4).entries }

    its(:id) { should match(/acl-[a-z0-9]{8}/) }

    its(:tag_set) { should have(1).entry }

    its(:tag_set) { should have_key 'Name' }

    its(:tag_set) { should have_key('Name').with_value('test') }

    its(:vpc_id) { should match(/vpc-[a-z0-9]{8}/) }
  end
end
