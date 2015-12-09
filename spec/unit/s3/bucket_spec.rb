require 'spec_helper'

VCR.use_cassette('s3/bucket') do
  describe Bucket 'tarak' do
    let(:contents) do
      [
        { 'Owner' => {
          'ID' => /[a-z0-9]{64}/
        },
          'Key' => 'test/',
          'LastModified' => Time.parse('2015-12-06 18:21:09 UTC'),
          'ETag' => /[a-z0-9]{32}/,
          'Size' => 0,
          'StorageClass' => 'STANDARD'
       },
        { 'Owner' =>        {
          'ID' => /[a-z0-9]{64}/
        },
          'Key' => 'test/test.txt',
          'LastModified' => Time.parse('2015-12-06 18:22:13 UTC'),
          'ETag' => /[a-z0-9]{32}/,
          'Size' => 5,
          'StorageClass' => 'STANDARD'
         }
      ]
    end

    its(:common_prefixes) { should be_empty }

    its(:contents) { should match(contents) }

    its(:marker) { should be_nil }

    its(:prefix) { should be_nil }

    its(:is_truncated?) { should be_falsey }
  end
end
