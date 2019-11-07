##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
#
# frozen_string_literal: true

module Twilio
  module REST
    class Trunking < Domain
      class V1 < Version
        class TrunkContext < InstanceContext
          class PhoneNumberList < ListResource
            ##
            # Initialize the PhoneNumberList
            # @param [Version] version Version that contains the resource
            # @param [String] trunk_sid The SID of the Trunk that handles calls to the phone
            #   number. If a `trunk_sid` is present, we ignore all of the voice URLs and voice
            #   applications and use those set on the Trunk. Setting a `trunk_sid` will
            #   automatically delete your `voice_application_sid` and vice versa.
            # @return [PhoneNumberList] PhoneNumberList
            def initialize(version, trunk_sid: nil)
              super(version)

              # Path Solution
              @solution = {trunk_sid: trunk_sid}
              @uri = "/Trunks/#{@solution[:trunk_sid]}/PhoneNumbers"
            end

            ##
            # Retrieve a single page of PhoneNumberInstance records from the API.
            # Request is executed immediately.
            # @param [String] phone_number_sid The SID of the [Incoming Phone
            #   Number](https://www.twilio.com/docs/phone-numbers/api/incomingphonenumber-resource) that you want to associate with the trunk.
            # @return [PhoneNumberInstance] Newly created PhoneNumberInstance
            def create(phone_number_sid: nil)
              data = Twilio::Values.of({'PhoneNumberSid' => phone_number_sid, })

              payload = @version.create(
                  'POST',
                  @uri,
                  data: data
              )

              PhoneNumberInstance.new(@version, payload, trunk_sid: @solution[:trunk_sid], )
            end

            ##
            # Lists PhoneNumberInstance records from the API as a list.
            # Unlike stream(), this operation is eager and will load `limit` records into
            # memory before returning.
            # @param [Integer] limit Upper limit for the number of records to return. stream()
            #    guarantees to never return more than limit.  Default is no limit
            # @param [Integer] page_size Number of records to fetch per request, when
            #    not set will use the default value of 50 records.  If no page_size is defined
            #    but a limit is defined, stream() will attempt to read the limit with the most
            #    efficient page size, i.e. min(limit, 1000)
            # @return [Array] Array of up to limit results
            def list(limit: nil, page_size: nil)
              self.stream(limit: limit, page_size: page_size).entries
            end

            ##
            # Streams PhoneNumberInstance records from the API as an Enumerable.
            # This operation lazily loads records as efficiently as possible until the limit
            # is reached.
            # @param [Integer] limit Upper limit for the number of records to return. stream()
            #    guarantees to never return more than limit. Default is no limit.
            # @param [Integer] page_size Number of records to fetch per request, when
            #    not set will use the default value of 50 records. If no page_size is defined
            #    but a limit is defined, stream() will attempt to read the limit with the most
            #    efficient page size, i.e. min(limit, 1000)
            # @return [Enumerable] Enumerable that will yield up to limit results
            def stream(limit: nil, page_size: nil)
              limits = @version.read_limits(limit, page_size)

              page = self.page(page_size: limits[:page_size], )

              @version.stream(page, limit: limits[:limit], page_limit: limits[:page_limit])
            end

            ##
            # When passed a block, yields PhoneNumberInstance records from the API.
            # This operation lazily loads records as efficiently as possible until the limit
            # is reached.
            def each
              limits = @version.read_limits

              page = self.page(page_size: limits[:page_size], )

              @version.stream(page,
                              limit: limits[:limit],
                              page_limit: limits[:page_limit]).each {|x| yield x}
            end

            ##
            # Retrieve a single page of PhoneNumberInstance records from the API.
            # Request is executed immediately.
            # @param [String] page_token PageToken provided by the API
            # @param [Integer] page_number Page Number, this value is simply for client state
            # @param [Integer] page_size Number of records to return, defaults to 50
            # @return [Page] Page of PhoneNumberInstance
            def page(page_token: :unset, page_number: :unset, page_size: :unset)
              params = Twilio::Values.of({
                  'PageToken' => page_token,
                  'Page' => page_number,
                  'PageSize' => page_size,
              })
              response = @version.page(
                  'GET',
                  @uri,
                  params
              )
              PhoneNumberPage.new(@version, response, @solution)
            end

            ##
            # Retrieve a single page of PhoneNumberInstance records from the API.
            # Request is executed immediately.
            # @param [String] target_url API-generated URL for the requested results page
            # @return [Page] Page of PhoneNumberInstance
            def get_page(target_url)
              response = @version.domain.request(
                  'GET',
                  target_url
              )
              PhoneNumberPage.new(@version, response, @solution)
            end

            ##
            # Provide a user friendly representation
            def to_s
              '#<Twilio.Trunking.V1.PhoneNumberList>'
            end
          end

          class PhoneNumberPage < Page
            ##
            # Initialize the PhoneNumberPage
            # @param [Version] version Version that contains the resource
            # @param [Response] response Response from the API
            # @param [Hash] solution Path solution for the resource
            # @return [PhoneNumberPage] PhoneNumberPage
            def initialize(version, response, solution)
              super(version, response)

              # Path Solution
              @solution = solution
            end

            ##
            # Build an instance of PhoneNumberInstance
            # @param [Hash] payload Payload response from the API
            # @return [PhoneNumberInstance] PhoneNumberInstance
            def get_instance(payload)
              PhoneNumberInstance.new(@version, payload, trunk_sid: @solution[:trunk_sid], )
            end

            ##
            # Provide a user friendly representation
            def to_s
              '<Twilio.Trunking.V1.PhoneNumberPage>'
            end
          end

          class PhoneNumberContext < InstanceContext
            ##
            # Initialize the PhoneNumberContext
            # @param [Version] version Version that contains the resource
            # @param [String] trunk_sid The SID of the Trunk from which to fetch the
            #   PhoneNumber resource.
            # @param [String] sid The unique string that we created to identify the
            #   PhoneNumber resource to fetch.
            # @return [PhoneNumberContext] PhoneNumberContext
            def initialize(version, trunk_sid, sid)
              super(version)

              # Path Solution
              @solution = {trunk_sid: trunk_sid, sid: sid, }
              @uri = "/Trunks/#{@solution[:trunk_sid]}/PhoneNumbers/#{@solution[:sid]}"
            end

            ##
            # Fetch a PhoneNumberInstance
            # @return [PhoneNumberInstance] Fetched PhoneNumberInstance
            def fetch
              params = Twilio::Values.of({})

              payload = @version.fetch(
                  'GET',
                  @uri,
                  params,
              )

              PhoneNumberInstance.new(@version, payload, trunk_sid: @solution[:trunk_sid], sid: @solution[:sid], )
            end

            ##
            # Deletes the PhoneNumberInstance
            # @return [Boolean] true if delete succeeds, false otherwise
            def delete
              @version.delete('delete', @uri)
            end

            ##
            # Provide a user friendly representation
            def to_s
              context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
              "#<Twilio.Trunking.V1.PhoneNumberContext #{context}>"
            end

            ##
            # Provide a detailed, user friendly representation
            def inspect
              context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
              "#<Twilio.Trunking.V1.PhoneNumberContext #{context}>"
            end
          end

          class PhoneNumberInstance < InstanceResource
            ##
            # Initialize the PhoneNumberInstance
            # @param [Version] version Version that contains the resource
            # @param [Hash] payload payload that contains response from Twilio
            # @param [String] trunk_sid The SID of the Trunk that handles calls to the phone
            #   number. If a `trunk_sid` is present, we ignore all of the voice URLs and voice
            #   applications and use those set on the Trunk. Setting a `trunk_sid` will
            #   automatically delete your `voice_application_sid` and vice versa.
            # @param [String] sid The unique string that we created to identify the
            #   PhoneNumber resource to fetch.
            # @return [PhoneNumberInstance] PhoneNumberInstance
            def initialize(version, payload, trunk_sid: nil, sid: nil)
              super(version)

              # Marshaled Properties
              @properties = {
                  'account_sid' => payload['account_sid'],
                  'address_requirements' => payload['address_requirements'],
                  'api_version' => payload['api_version'].to_json,
                  'beta' => payload['beta'],
                  'capabilities' => payload['capabilities'],
                  'date_created' => Twilio.deserialize_iso8601_datetime(payload['date_created']),
                  'date_updated' => Twilio.deserialize_iso8601_datetime(payload['date_updated']),
                  'friendly_name' => payload['friendly_name'].to_json,
                  'links' => payload['links'],
                  'phone_number' => payload['phone_number'],
                  'sid' => payload['sid'],
                  'sms_application_sid' => payload['sms_application_sid'],
                  'sms_fallback_method' => payload['sms_fallback_method'],
                  'sms_fallback_url' => payload['sms_fallback_url'],
                  'sms_method' => payload['sms_method'],
                  'sms_url' => payload['sms_url'],
                  'status_callback' => payload['status_callback'],
                  'status_callback_method' => payload['status_callback_method'],
                  'trunk_sid' => payload['trunk_sid'],
                  'url' => payload['url'],
                  'voice_application_sid' => payload['voice_application_sid'],
                  'voice_caller_id_lookup' => payload['voice_caller_id_lookup'],
                  'voice_fallback_method' => payload['voice_fallback_method'],
                  'voice_fallback_url' => payload['voice_fallback_url'],
                  'voice_method' => payload['voice_method'],
                  'voice_url' => payload['voice_url'],
              }

              # Context
              @instance_context = nil
              @params = {'trunk_sid' => trunk_sid, 'sid' => sid || @properties['sid'], }
            end

            ##
            # Generate an instance context for the instance, the context is capable of
            # performing various actions.  All instance actions are proxied to the context
            # @return [PhoneNumberContext] PhoneNumberContext for this PhoneNumberInstance
            def context
              unless @instance_context
                @instance_context = PhoneNumberContext.new(@version, @params['trunk_sid'], @params['sid'], )
              end
              @instance_context
            end

            ##
            # @return [String] The SID of the Account that created the resource
            def account_sid
              @properties['account_sid']
            end

            ##
            # @return [phone_number.AddressRequirement] Whether the phone number requires an Address registered with Twilio
            def address_requirements
              @properties['address_requirements']
            end

            ##
            # @return [String] The API version used to start a new TwiML session
            def api_version
              @properties['api_version']
            end

            ##
            # @return [Boolean] Whether the phone number is new to the Twilio platform
            def beta
              @properties['beta']
            end

            ##
            # @return [Hash] Indicate if a phone can receive calls or messages
            def capabilities
              @properties['capabilities']
            end

            ##
            # @return [Time] The RFC 2822 date and time in GMT when the resource was created
            def date_created
              @properties['date_created']
            end

            ##
            # @return [Time] The RFC 2822 date and time in GMT when the resource was last updated
            def date_updated
              @properties['date_updated']
            end

            ##
            # @return [String] The string that you assigned to describe the resource
            def friendly_name
              @properties['friendly_name']
            end

            ##
            # @return [String] The URLs of related resources
            def links
              @properties['links']
            end

            ##
            # @return [String] The phone number in E.164 format
            def phone_number
              @properties['phone_number']
            end

            ##
            # @return [String] The unique string that identifies the resource
            def sid
              @properties['sid']
            end

            ##
            # @return [String] The SID of the application that handles SMS messages sent to the phone number
            def sms_application_sid
              @properties['sms_application_sid']
            end

            ##
            # @return [String] The HTTP method used with sms_fallback_url
            def sms_fallback_method
              @properties['sms_fallback_method']
            end

            ##
            # @return [String] The URL that we call when an error occurs while retrieving or executing the TwiML
            def sms_fallback_url
              @properties['sms_fallback_url']
            end

            ##
            # @return [String] The HTTP method to use with sms_url
            def sms_method
              @properties['sms_method']
            end

            ##
            # @return [String] The URL we call when the phone number receives an incoming SMS message
            def sms_url
              @properties['sms_url']
            end

            ##
            # @return [String] The URL to send status information to your application
            def status_callback
              @properties['status_callback']
            end

            ##
            # @return [String] The HTTP method we use to call status_callback
            def status_callback_method
              @properties['status_callback_method']
            end

            ##
            # @return [String] The SID of the Trunk that handles calls to the phone number
            def trunk_sid
              @properties['trunk_sid']
            end

            ##
            # @return [String] The absolute URL of the resource
            def url
              @properties['url']
            end

            ##
            # @return [String] The SID of the application that handles calls to the phone number
            def voice_application_sid
              @properties['voice_application_sid']
            end

            ##
            # @return [Boolean] Whether to lookup the caller's name
            def voice_caller_id_lookup
              @properties['voice_caller_id_lookup']
            end

            ##
            # @return [String] The HTTP method that we use to call voice_fallback_url
            def voice_fallback_method
              @properties['voice_fallback_method']
            end

            ##
            # @return [String] The URL we call when an error occurs in TwiML
            def voice_fallback_url
              @properties['voice_fallback_url']
            end

            ##
            # @return [String] The HTTP method used with the voice_url
            def voice_method
              @properties['voice_method']
            end

            ##
            # @return [String] The URL we call when the phone number receives a call
            def voice_url
              @properties['voice_url']
            end

            ##
            # Fetch a PhoneNumberInstance
            # @return [PhoneNumberInstance] Fetched PhoneNumberInstance
            def fetch
              context.fetch
            end

            ##
            # Deletes the PhoneNumberInstance
            # @return [Boolean] true if delete succeeds, false otherwise
            def delete
              context.delete
            end

            ##
            # Provide a user friendly representation
            def to_s
              values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
              "<Twilio.Trunking.V1.PhoneNumberInstance #{values}>"
            end

            ##
            # Provide a detailed, user friendly representation
            def inspect
              values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
              "<Twilio.Trunking.V1.PhoneNumberInstance #{values}>"
            end
          end
        end
      end
    end
  end
end