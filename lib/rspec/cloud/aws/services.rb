module RSpec::Cloud::Aws
  module Services
    def ec2
      logger.debug("Creating EC2 Client for region: #{region}")
      @ec2 ||= Fog::Compute.new provider: 'AWS', region: region, use_iam_profile: use_iam_profile?
      @ec2
    end

    def s3
      logger.debug("Creating S3 Client for region: #{region}")
      @s3 ||= Fog::Storage::AWS.new region: region, use_iam_profile: use_iam_profile?
      @s3
    end

    %w(AutoScaling CloudFormation CloudWatch DataPipeline DynamoDB ECS ELB
       EMR ElasticBeanstalk Elasticache Federation Glacier IAM Kinesis KMS
       Lambda RDS Redshift SES SNS SQS STS SimpleDB).each do |service|
      method_name = service.downcase.to_sym

      define_method(method_name) do
        logger.debug("Creating #{service} Client for region: #{region}")
        class_name = "Fog::AWS::#{service}"
        service_name = service.downcase
        val = Kernel.const_get(class_name).new use_iam_profile: use_iam_profile? unless instance_variable_get('@' + service_name)
        instance_variable_set('@' + service_name, val) unless instance_variable_get('@' + service_name)
        instance_variable_get('@' + service_name)
      end
    end
  end
end
