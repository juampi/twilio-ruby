##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
#
# frozen_string_literal: true

module Twilio
  module REST
    class Insights < Domain
      class V1 < Version
        ##
        # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
        class CallSummaryList < ListResource
          ##
          # Initialize the CallSummaryList
          # @param [Version] version Version that contains the resource
          # @return [CallSummaryList] CallSummaryList
          def initialize(version)
            super(version)

            # Path Solution
            @solution = {}
          end

          ##
          # Provide a user friendly representation
          def to_s
            '#<Twilio.Insights.V1.CallSummaryList>'
          end
        end

        ##
        # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
        class CallSummaryPage < Page
          ##
          # Initialize the CallSummaryPage
          # @param [Version] version Version that contains the resource
          # @param [Response] response Response from the API
          # @param [Hash] solution Path solution for the resource
          # @return [CallSummaryPage] CallSummaryPage
          def initialize(version, response, solution)
            super(version, response)

            # Path Solution
            @solution = solution
          end

          ##
          # Build an instance of CallSummaryInstance
          # @param [Hash] payload Payload response from the API
          # @return [CallSummaryInstance] CallSummaryInstance
          def get_instance(payload)
            CallSummaryInstance.new(@version, payload, )
          end

          ##
          # Provide a user friendly representation
          def to_s
            '<Twilio.Insights.V1.CallSummaryPage>'
          end
        end

        ##
        # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
        class CallSummaryContext < InstanceContext
          ##
          # Initialize the CallSummaryContext
          # @param [Version] version Version that contains the resource
          # @param [String] call_sid The call_sid
          # @return [CallSummaryContext] CallSummaryContext
          def initialize(version, call_sid)
            super(version)

            # Path Solution
            @solution = {call_sid: call_sid, }
            @uri = "/Voice/#{@solution[:call_sid]}/Summary"
          end

          ##
          # Fetch a CallSummaryInstance
          # @param [call_summary.ProcessingState] processing_state The processing_state
          # @return [CallSummaryInstance] Fetched CallSummaryInstance
          def fetch(processing_state: :unset)
            params = Twilio::Values.of({'ProcessingState' => processing_state, })

            payload = @version.fetch(
                'GET',
                @uri,
                params,
            )

            CallSummaryInstance.new(@version, payload, call_sid: @solution[:call_sid], )
          end

          ##
          # Provide a user friendly representation
          def to_s
            context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
            "#<Twilio.Insights.V1.CallSummaryContext #{context}>"
          end

          ##
          # Provide a detailed, user friendly representation
          def inspect
            context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
            "#<Twilio.Insights.V1.CallSummaryContext #{context}>"
          end
        end

        ##
        # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
        class CallSummaryInstance < InstanceResource
          ##
          # Initialize the CallSummaryInstance
          # @param [Version] version Version that contains the resource
          # @param [Hash] payload payload that contains response from Twilio
          # @param [String] call_sid The call_sid
          # @return [CallSummaryInstance] CallSummaryInstance
          def initialize(version, payload, call_sid: nil)
            super(version)

            # Marshaled Properties
            @properties = {
                'account_sid' => payload['account_sid'],
                'call_sid' => payload['call_sid'],
                'call_type' => payload['call_type'],
                'call_state' => payload['call_state'],
                'processing_state' => payload['processing_state'],
                'start_time' => Twilio.deserialize_iso8601_datetime(payload['start_time']),
                'end_time' => Twilio.deserialize_iso8601_datetime(payload['end_time']),
                'duration' => payload['duration'] == nil ? payload['duration'] : payload['duration'].to_i,
                'connect_duration' => payload['connect_duration'] == nil ? payload['connect_duration'] : payload['connect_duration'].to_i,
                'from' => payload['from'],
                'to' => payload['to'],
                'carrier_edge' => payload['carrier_edge'],
                'client_edge' => payload['client_edge'],
                'sdk_edge' => payload['sdk_edge'],
                'sip_edge' => payload['sip_edge'],
                'tags' => payload['tags'].to_json,
                'url' => payload['url'],
                'attributes' => payload['attributes'],
                'properties' => payload['properties'],
            }

            # Context
            @instance_context = nil
            @params = {'call_sid' => call_sid || @properties['call_sid'], }
          end

          ##
          # Generate an instance context for the instance, the context is capable of
          # performing various actions.  All instance actions are proxied to the context
          # @return [CallSummaryContext] CallSummaryContext for this CallSummaryInstance
          def context
            unless @instance_context
              @instance_context = CallSummaryContext.new(@version, @params['call_sid'], )
            end
            @instance_context
          end

          ##
          # @return [String] The account_sid
          def account_sid
            @properties['account_sid']
          end

          ##
          # @return [String] The call_sid
          def call_sid
            @properties['call_sid']
          end

          ##
          # @return [call_summary.CallType] The call_type
          def call_type
            @properties['call_type']
          end

          ##
          # @return [call_summary.CallState] The call_state
          def call_state
            @properties['call_state']
          end

          ##
          # @return [call_summary.ProcessingState] The processing_state
          def processing_state
            @properties['processing_state']
          end

          ##
          # @return [Time] The start_time
          def start_time
            @properties['start_time']
          end

          ##
          # @return [Time] The end_time
          def end_time
            @properties['end_time']
          end

          ##
          # @return [String] The duration
          def duration
            @properties['duration']
          end

          ##
          # @return [String] The connect_duration
          def connect_duration
            @properties['connect_duration']
          end

          ##
          # @return [Hash] The from
          def from
            @properties['from']
          end

          ##
          # @return [Hash] The to
          def to
            @properties['to']
          end

          ##
          # @return [Hash] The carrier_edge
          def carrier_edge
            @properties['carrier_edge']
          end

          ##
          # @return [Hash] The client_edge
          def client_edge
            @properties['client_edge']
          end

          ##
          # @return [Hash] The sdk_edge
          def sdk_edge
            @properties['sdk_edge']
          end

          ##
          # @return [Hash] The sip_edge
          def sip_edge
            @properties['sip_edge']
          end

          ##
          # @return [String] The tags
          def tags
            @properties['tags']
          end

          ##
          # @return [String] The url
          def url
            @properties['url']
          end

          ##
          # @return [Hash] The attributes
          def attributes
            @properties['attributes']
          end

          ##
          # @return [Hash] The properties
          def properties
            @properties['properties']
          end

          ##
          # Fetch a CallSummaryInstance
          # @param [call_summary.ProcessingState] processing_state The processing_state
          # @return [CallSummaryInstance] Fetched CallSummaryInstance
          def fetch(processing_state: :unset)
            context.fetch(processing_state: processing_state, )
          end

          ##
          # Provide a user friendly representation
          def to_s
            values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
            "<Twilio.Insights.V1.CallSummaryInstance #{values}>"
          end

          ##
          # Provide a detailed, user friendly representation
          def inspect
            values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
            "<Twilio.Insights.V1.CallSummaryInstance #{values}>"
          end
        end
      end
    end
  end
end