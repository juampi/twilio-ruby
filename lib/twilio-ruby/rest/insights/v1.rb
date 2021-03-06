##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
#
# frozen_string_literal: true

module Twilio
  module REST
    class Insights
      class V1 < Version
        ##
        # Initialize the V1 version of Insights
        def initialize(domain)
          super
          @version = 'v1'
          @calls = nil
        end

        ##
        # @param [String] sid The sid
        # @return [Twilio::REST::Insights::V1::CallContext] if sid was passed.
        # @return [Twilio::REST::Insights::V1::CallList]
        def calls(sid=:unset)
          if sid.nil?
            raise ArgumentError, 'sid cannot be nil'
          elsif sid == :unset
            @calls ||= CallList.new self
          else
            CallContext.new(self, sid)
          end
        end

        ##
        # Provide a user friendly representation
        def to_s
          '<Twilio::REST::Insights::V1>'
        end
      end
    end
  end
end