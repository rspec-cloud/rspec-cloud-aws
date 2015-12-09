module RSpec::Cloud::Aws::Resources
  module Support
    def has_id?(value)
      logger.debug "Verifying id in method has_id? for #{self}"
      result = id == value
      logger.debug "Got result #{result} verifying id in method has_id? for #{self}"
      result
    end

    def id
      logger.debug "Verifying id in method id for #{self}"
      result = nil
      result = resource[@identifier] if @identifier
      logger.debug "Got result #{result} verifying id in method id for #{self}"
      result
    end
  end
end
