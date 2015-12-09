require 'spec_helper'

VCR.use_cassette('ec2/instance') do
  describe Instance 'test' do
    let(:block_device_mapping) do
      [
        {
          'deviceName' => '/dev/sda1',
          'volumeId' => /^vol-[a-z0-9]{8}$/,
          'status' => 'attached',
          'attachTime' => Time.parse('2015-12-06 14:20:45 UTC'),
          'deleteOnTermination' => true
        }
      ]
    end

    let(:iam_instance_profile) do
      {
        'arn' => %r/arn:aws:iam::[\d]{12}:instance-profile\/test/,
        'id' => /[A-Z0-9]{21}/
      }
    end

    let(:instance_state) do
      { 'code' => 16, 'name' => 'running' }
    end

    let(:network_interfaces) do
      [
        {
          'ownerId' => /^[0-9]{12}$/,
          'subnetId' => /^subnet-[a-z0-9]{8}$/,
          'vpcId' => /^vpc-[a-z0-9]{8}$/,
          'networkInterfaceId' => /^eni-[a-z0-9]{8}$/,
          'groupIds' => [/^sg-[a-z0-9]{8}$/],
          'groupSet' => ['default'],
          'attachmentId' => /^eni-attach-[a-z0-9]{8}$/
        },
        {}
      ]
    end

    let(:placement) do
      {
        'availabilityZone' => 'eu-central-1a',
        'groupName' => nil,
        'tenancy' => 'default'
      }
    end

    its(:ami_launch_index) { should be_zero }

    its(:architecture) { should be_equal_to 'x86_64' }

    its(:attachment_id) { should match(/^eni-attach-[a-z0-9]{8}$/) }

    its(:availability_zone) { should be_equal_to 'eu-central-1a' }

    its(:block_device_mapping) { should match(block_device_mapping) }

    its(:client_token) { should match(/\A[a-zA-Z0-9]{18}\z/) }

    its(:dns_name) { should be_nil }

    it { should_not be_ebs_optimized }

    its(:hypervisor) { should be_equal_to 'xen' }

    its(:iam_instance_profile) { should match(iam_instance_profile) }

    its(:id) { should match(/^i-[a-z0-9]{8}$/) }

    its(:image_id) { should match(/^ami-[a-z0-9]{8}$/) }

    its(:instance_state) { should match(instance_state) }

    its(:instance_type) { should be_equal_to 't2.micro' }

    its(:ip_address) { should be_equal_to '52.29.234.162' }

    its(:key_name) { should be_equal_to 'test' }

    its(:launch_time) { should eq Time.parse('2015-12-06 14:20:42 UTC') }

    its(:monitoring) { should match('state' => false) }

    its(:network_interface_id) { should match(/^eni-[a-z0-9]{8}$/) }

    its(:network_interfaces) { should match(network_interfaces) }

    its(:owner_id) { should be_an(Integer) }

    its(:owner_id) { should have_digits(12) }

    its(:placement) { should match(placement) }

    its(:placement_group) { should be_nil }

    its(:private_dns_name) { should be_equal_to 'ip-192-168-0-26.eu-central-1.compute.internal' }

    its(:private_ip_address) { should be_equal_to '192.168.0.26' }

    its(:product_codes) { should be_empty }

    its(:reason) { should be_nil }

    its(:root_device_name) { should be_equal_to '/dev/sda1' }

    its(:root_device_type) { should be_equal_to 'ebs' }

    its(:source_dest_check?) { should be_truthy }

    its(:state_reason) { should be_empty }

    its(:subnet_id) { should match(/^subnet-[a-z0-9]{8}$/) }

    its(:tag_set) { should have(1).entry }

    its(:tag_set) { should have_key('Name').with_value('test') }

    its(:tenancy) { should be_equal_to 'default' }

    its(:virtualization_type) { should be_equal_to 'hvm' }

    its(:vpc_id) { should match(/vpc-[a-z0-9]{8}/) }
  end
end
