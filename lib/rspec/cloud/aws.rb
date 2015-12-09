require 'rspec/cloud/core'

class Integer
  def digits
    to_s.gsub(/^\-/, '').size
  end
end

RSpec::Matchers.define :have_digits do |expected|
  match do |actual|
    actual.digits == expected
  end

  description do
    if expected > 1
      "have #{expected} digits"
    else
      'have 1 digit'
    end
  end

  failure_message do |actual|
    if expected > 1
      "expected that #{actual} would have #{expected} digits"
    else
      "expected that #{actual} would have 1 digit"
    end
  end

  failure_message_when_negated do |actual|
    if expected > 1
      "expected that #{actual} would not have #{expected} digits"
    else
      "expected that #{actual} would not have 1 digit"
    end
  end
end

require 'rspec/cloud/aws/version'
require 'rspec/cloud/aws/services'
require 'rspec/cloud/aws/helper'
require 'rspec/cloud/aws/subject'

RSpec.configure do |c|
  c.add_setting(:region, default: 'us-east-1')
  c.add_setting(:use_iam_profile, default: false)
  c.add_setting(:log_level, default: Logger::INFO)
end
