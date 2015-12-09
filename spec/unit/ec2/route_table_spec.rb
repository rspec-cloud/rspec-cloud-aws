require 'spec_helper'

VCR.use_cassette('ec2/route_table') do
  describe RouteTable 'test' do
    let(:association_set) do
      [
        {
          'main' => false,
          'routeTableAssociationId' => /rtbassoc-[a-z0-9]{8}/,
          'routeTableId' => /rtb-[a-z0-9]{8}/,
          'subnetId' => /subnet-[a-z0-9]{8}/
        },
        {
          'main' => false,
          'routeTableAssociationId' => /rtbassoc-[a-z0-9]{8}/,
          'routeTableId' => /rtb-[a-z0-9]{8}/,
          'subnetId' => /subnet-[a-z0-9]{8}/
        },
        {
          'main' => true,
          'routeTableAssociationId' => /rtbassoc-[a-z0-9]{8}/,
          'routeTableId' => /rtb-[a-z0-9]{8}/,
          'subnetId' => nil
        }
      ]
    end

    let(:route_set) do
      [
        {
          'destinationCidrBlock' => '192.168.0.0/24',
          'gatewayId' => 'local',
          'instanceId' => nil,
          'instanceOwnerId' => nil,
          'networkInterfaceId' => nil,
          'origin' => 'CreateRouteTable',
          'state' => 'active',
          'vpcPeeringConnectionId' => nil
        },
        {
          'destinationCidrBlock' => '0.0.0.0/0',
          'gatewayId' => /igw-[a-z0-9]{8}/,
          'instanceId' => nil,
          'instanceOwnerId' => nil,
          'networkInterfaceId' => nil,
          'origin' => 'CreateRoute',
          'state' => 'active',
          'vpcPeeringConnectionId' => nil
        }
      ]
    end

    its(:association_set) { should match(association_set) }

    it { should be_default }

    its(:id) { should match(/rtb-[a-z0-9]{8}/) }

    its(:route_set) { should match(route_set) }

    its(:tag_set) { should have(1).entry }

    its(:tag_set) { should have_key 'Name' }

    its(:tag_set) { should have_key('Name').with_value('test') }

    its(:vpc_id) { should match(/vpc-[a-z0-9]{8}/) }
  end
end
