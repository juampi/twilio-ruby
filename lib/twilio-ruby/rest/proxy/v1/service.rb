##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
#
# frozen_string_literal: true

module Twilio
  module REST
    class Proxy < Domain
      class V1 < Version
        ##
        # PLEASE NOTE that this class contains beta products that are subject to change. Use them with caution.
        class ServiceList < ListResource
          ##
          # Initialize the ServiceList
          # @param [Version] version Version that contains the resource
          # @return [ServiceList] ServiceList
          def initialize(version)
            super(version)

            # Path Solution
            @solution = {}
            @uri = "/Services"
          end

          ##
          # Lists ServiceInstance records from the API as a list.
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
          # Streams ServiceInstance records from the API as an Enumerable.
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
          # When passed a block, yields ServiceInstance records from the API.
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
          # Retrieve a single page of ServiceInstance records from the API.
          # Request is executed immediately.
          # @param [String] page_token PageToken provided by the API
          # @param [Integer] page_number Page Number, this value is simply for client state
          # @param [Integer] page_size Number of records to return, defaults to 50
          # @return [Page] Page of ServiceInstance
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
            ServicePage.new(@version, response, @solution)
          end

          ##
          # Retrieve a single page of ServiceInstance records from the API.
          # Request is executed immediately.
          # @param [String] target_url API-generated URL for the requested results page
          # @return [Page] Page of ServiceInstance
          def get_page(target_url)
            response = @version.domain.request(
                'GET',
                target_url
            )
            ServicePage.new(@version, response, @solution)
          end

          ##
          # Retrieve a single page of ServiceInstance records from the API.
          # Request is executed immediately.
          # @param [String] unique_name An application-defined string that uniquely
          #   identifies the resource. This value must be 191 characters or fewer in length
          #   and be unique. **This value should not have PII.**
          # @param [String] default_ttl The default `ttl` value to set for Sessions created
          #   in the Service. The TTL (time to live) is measured in seconds after the
          #   Session's last create or last Interaction. The default value of `0` indicates an
          #   unlimited Session length. You can override a Session's default TTL value by
          #   setting its `ttl` value.
          # @param [String] callback_url The URL we should call when the interaction status
          #   changes.
          # @param [service.GeoMatchLevel] geo_match_level Where a proxy number must be
          #   located relative to the participant identifier. Can be: `country`, `area-code`,
          #   or `extended-area-code`. The default value is `country` and more specific areas
          #   than `country` are only available in North America.
          # @param [service.NumberSelectionBehavior] number_selection_behavior The
          #   preference for Proxy Number selection in the Service instance. Can be:
          #   `prefer-sticky` or `avoid-sticky` and the default is `prefer-sticky`.
          #   `prefer-sticky` means that we will try and select the same Proxy Number for a
          #   given participant if they have previous
          #   [Sessions](https://www.twilio.com/docs/proxy/api/session), but we will not fail
          #   if that Proxy Number cannot be used.  `avoid-sticky` means that we will try to
          #   use different Proxy Numbers as long as that is possible within a given pool
          #   rather than try and use a previously assigned number.
          # @param [String] intercept_callback_url The URL we call on each interaction. If
          #   we receive a 403 status, we block the interaction; otherwise the interaction
          #   continues.
          # @param [String] out_of_session_callback_url The URL we should call when an
          #   inbound call or SMS action occurs on a closed or non-existent Session. If your
          #   server (or a Twilio [function](https://www.twilio.com/functions)) responds with
          #   valid [TwiML](https://www.twilio.com/docs/voice/twiml), we will process it. This
          #   means it is possible, for example, to play a message for a call, send an
          #   automated text message response, or redirect a call to another Phone Number. See
          #   [Out-of-Session Callback Response
          #   Guide](https://www.twilio.com/docs/proxy/out-session-callback-response-guide)
          #   for more information.
          # @param [String] chat_instance_sid The SID of the Chat Service Instance managed
          #   by Proxy Service. The Chat Service enables Proxy to forward SMS and channel
          #   messages to this chat instance. This is a one-to-one relationship.
          # @return [ServiceInstance] Newly created ServiceInstance
          def create(unique_name: nil, default_ttl: :unset, callback_url: :unset, geo_match_level: :unset, number_selection_behavior: :unset, intercept_callback_url: :unset, out_of_session_callback_url: :unset, chat_instance_sid: :unset)
            data = Twilio::Values.of({
                'UniqueName' => unique_name,
                'DefaultTtl' => default_ttl,
                'CallbackUrl' => callback_url,
                'GeoMatchLevel' => geo_match_level,
                'NumberSelectionBehavior' => number_selection_behavior,
                'InterceptCallbackUrl' => intercept_callback_url,
                'OutOfSessionCallbackUrl' => out_of_session_callback_url,
                'ChatInstanceSid' => chat_instance_sid,
            })

            payload = @version.create(
                'POST',
                @uri,
                data: data
            )

            ServiceInstance.new(@version, payload, )
          end

          ##
          # Provide a user friendly representation
          def to_s
            '#<Twilio.Proxy.V1.ServiceList>'
          end
        end

        ##
        # PLEASE NOTE that this class contains beta products that are subject to change. Use them with caution.
        class ServicePage < Page
          ##
          # Initialize the ServicePage
          # @param [Version] version Version that contains the resource
          # @param [Response] response Response from the API
          # @param [Hash] solution Path solution for the resource
          # @return [ServicePage] ServicePage
          def initialize(version, response, solution)
            super(version, response)

            # Path Solution
            @solution = solution
          end

          ##
          # Build an instance of ServiceInstance
          # @param [Hash] payload Payload response from the API
          # @return [ServiceInstance] ServiceInstance
          def get_instance(payload)
            ServiceInstance.new(@version, payload, )
          end

          ##
          # Provide a user friendly representation
          def to_s
            '<Twilio.Proxy.V1.ServicePage>'
          end
        end

        ##
        # PLEASE NOTE that this class contains beta products that are subject to change. Use them with caution.
        class ServiceContext < InstanceContext
          ##
          # Initialize the ServiceContext
          # @param [Version] version Version that contains the resource
          # @param [String] sid The Twilio-provided string that uniquely identifies the
          #   Service resource to fetch.
          # @return [ServiceContext] ServiceContext
          def initialize(version, sid)
            super(version)

            # Path Solution
            @solution = {sid: sid, }
            @uri = "/Services/#{@solution[:sid]}"

            # Dependents
            @sessions = nil
            @phone_numbers = nil
            @short_codes = nil
          end

          ##
          # Fetch a ServiceInstance
          # @return [ServiceInstance] Fetched ServiceInstance
          def fetch
            params = Twilio::Values.of({})

            payload = @version.fetch(
                'GET',
                @uri,
                params,
            )

            ServiceInstance.new(@version, payload, sid: @solution[:sid], )
          end

          ##
          # Deletes the ServiceInstance
          # @return [Boolean] true if delete succeeds, false otherwise
          def delete
            @version.delete('delete', @uri)
          end

          ##
          # Update the ServiceInstance
          # @param [String] unique_name An application-defined string that uniquely
          #   identifies the resource. This value must be 191 characters or fewer in length
          #   and be unique. **This value should not have PII.**
          # @param [String] default_ttl The default `ttl` value to set for Sessions created
          #   in the Service. The TTL (time to live) is measured in seconds after the
          #   Session's last create or last Interaction. The default value of `0` indicates an
          #   unlimited Session length. You can override a Session's default TTL value by
          #   setting its `ttl` value.
          # @param [String] callback_url The URL we should call when the interaction status
          #   changes.
          # @param [service.GeoMatchLevel] geo_match_level Where a proxy number must be
          #   located relative to the participant identifier. Can be: `country`, `area-code`,
          #   or `extended-area-code`. The default value is `country` and more specific areas
          #   than `country` are only available in North America.
          # @param [service.NumberSelectionBehavior] number_selection_behavior The
          #   preference for Proxy Number selection in the Service instance. Can be:
          #   `prefer-sticky` or `avoid-sticky` and the default is `prefer-sticky`.
          #   `prefer-sticky` means that we will try and select the same Proxy Number for a
          #   given participant if they have previous
          #   [Sessions](https://www.twilio.com/docs/proxy/api/session), but we will not fail
          #   if that Proxy Number cannot be used.  `avoid-sticky` means that we will try to
          #   use different Proxy Numbers as long as that is possible within a given pool
          #   rather than try and use a previously assigned number.
          # @param [String] intercept_callback_url The URL we call on each interaction. If
          #   we receive a 403 status, we block the interaction; otherwise the interaction
          #   continues.
          # @param [String] out_of_session_callback_url The URL we should call when an
          #   inbound call or SMS action occurs on a closed or non-existent Session. If your
          #   server (or a Twilio [function](https://www.twilio.com/functions)) responds with
          #   valid [TwiML](https://www.twilio.com/docs/voice/twiml), we will process it. This
          #   means it is possible, for example, to play a message for a call, send an
          #   automated text message response, or redirect a call to another Phone Number. See
          #   [Out-of-Session Callback Response
          #   Guide](https://www.twilio.com/docs/proxy/out-session-callback-response-guide)
          #   for more information.
          # @param [String] chat_instance_sid The SID of the Chat Service Instance managed
          #   by Proxy Service. The Chat Service enables Proxy to forward SMS and channel
          #   messages to this chat instance. This is a one-to-one relationship.
          # @return [ServiceInstance] Updated ServiceInstance
          def update(unique_name: :unset, default_ttl: :unset, callback_url: :unset, geo_match_level: :unset, number_selection_behavior: :unset, intercept_callback_url: :unset, out_of_session_callback_url: :unset, chat_instance_sid: :unset)
            data = Twilio::Values.of({
                'UniqueName' => unique_name,
                'DefaultTtl' => default_ttl,
                'CallbackUrl' => callback_url,
                'GeoMatchLevel' => geo_match_level,
                'NumberSelectionBehavior' => number_selection_behavior,
                'InterceptCallbackUrl' => intercept_callback_url,
                'OutOfSessionCallbackUrl' => out_of_session_callback_url,
                'ChatInstanceSid' => chat_instance_sid,
            })

            payload = @version.update(
                'POST',
                @uri,
                data: data,
            )

            ServiceInstance.new(@version, payload, sid: @solution[:sid], )
          end

          ##
          # Access the sessions
          # @return [SessionList]
          # @return [SessionContext] if sid was passed.
          def sessions(sid=:unset)
            raise ArgumentError, 'sid cannot be nil' if sid.nil?

            if sid != :unset
              return SessionContext.new(@version, @solution[:sid], sid, )
            end

            unless @sessions
              @sessions = SessionList.new(@version, service_sid: @solution[:sid], )
            end

            @sessions
          end

          ##
          # Access the phone_numbers
          # @return [PhoneNumberList]
          # @return [PhoneNumberContext] if sid was passed.
          def phone_numbers(sid=:unset)
            raise ArgumentError, 'sid cannot be nil' if sid.nil?

            if sid != :unset
              return PhoneNumberContext.new(@version, @solution[:sid], sid, )
            end

            unless @phone_numbers
              @phone_numbers = PhoneNumberList.new(@version, service_sid: @solution[:sid], )
            end

            @phone_numbers
          end

          ##
          # Access the short_codes
          # @return [ShortCodeList]
          # @return [ShortCodeContext] if sid was passed.
          def short_codes(sid=:unset)
            raise ArgumentError, 'sid cannot be nil' if sid.nil?

            if sid != :unset
              return ShortCodeContext.new(@version, @solution[:sid], sid, )
            end

            unless @short_codes
              @short_codes = ShortCodeList.new(@version, service_sid: @solution[:sid], )
            end

            @short_codes
          end

          ##
          # Provide a user friendly representation
          def to_s
            context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
            "#<Twilio.Proxy.V1.ServiceContext #{context}>"
          end

          ##
          # Provide a detailed, user friendly representation
          def inspect
            context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
            "#<Twilio.Proxy.V1.ServiceContext #{context}>"
          end
        end

        ##
        # PLEASE NOTE that this class contains beta products that are subject to change. Use them with caution.
        class ServiceInstance < InstanceResource
          ##
          # Initialize the ServiceInstance
          # @param [Version] version Version that contains the resource
          # @param [Hash] payload payload that contains response from Twilio
          # @param [String] sid The Twilio-provided string that uniquely identifies the
          #   Service resource to fetch.
          # @return [ServiceInstance] ServiceInstance
          def initialize(version, payload, sid: nil)
            super(version)

            # Marshaled Properties
            @properties = {
                'sid' => payload['sid'],
                'unique_name' => payload['unique_name'].to_json,
                'account_sid' => payload['account_sid'],
                'chat_instance_sid' => payload['chat_instance_sid'],
                'callback_url' => payload['callback_url'],
                'default_ttl' => payload['default_ttl'].to_i,
                'number_selection_behavior' => payload['number_selection_behavior'],
                'geo_match_level' => payload['geo_match_level'],
                'intercept_callback_url' => payload['intercept_callback_url'],
                'out_of_session_callback_url' => payload['out_of_session_callback_url'],
                'date_created' => Twilio.deserialize_iso8601_datetime(payload['date_created']),
                'date_updated' => Twilio.deserialize_iso8601_datetime(payload['date_updated']),
                'url' => payload['url'],
                'links' => payload['links'],
            }

            # Context
            @instance_context = nil
            @params = {'sid' => sid || @properties['sid'], }
          end

          ##
          # Generate an instance context for the instance, the context is capable of
          # performing various actions.  All instance actions are proxied to the context
          # @return [ServiceContext] ServiceContext for this ServiceInstance
          def context
            unless @instance_context
              @instance_context = ServiceContext.new(@version, @params['sid'], )
            end
            @instance_context
          end

          ##
          # @return [String] The unique string that identifies the resource
          def sid
            @properties['sid']
          end

          ##
          # @return [String] An application-defined string that uniquely identifies the resource
          def unique_name
            @properties['unique_name']
          end

          ##
          # @return [String] The SID of the Account that created the resource
          def account_sid
            @properties['account_sid']
          end

          ##
          # @return [String] The SID of the Chat Service Instance
          def chat_instance_sid
            @properties['chat_instance_sid']
          end

          ##
          # @return [String] The URL we call when the interaction status changes
          def callback_url
            @properties['callback_url']
          end

          ##
          # @return [String] Default TTL for a Session, in seconds
          def default_ttl
            @properties['default_ttl']
          end

          ##
          # @return [service.NumberSelectionBehavior] The preference for Proxy Number selection for the Service instance
          def number_selection_behavior
            @properties['number_selection_behavior']
          end

          ##
          # @return [service.GeoMatchLevel] Where a proxy number must be located relative to the participant identifier
          def geo_match_level
            @properties['geo_match_level']
          end

          ##
          # @return [String] The URL we call on each interaction
          def intercept_callback_url
            @properties['intercept_callback_url']
          end

          ##
          # @return [String] The URL we call when an inbound call or SMS action occurs on a closed or non-existent Session
          def out_of_session_callback_url
            @properties['out_of_session_callback_url']
          end

          ##
          # @return [Time] The ISO 8601 date and time in GMT when the resource was created
          def date_created
            @properties['date_created']
          end

          ##
          # @return [Time] The ISO 8601 date and time in GMT when the resource was last updated
          def date_updated
            @properties['date_updated']
          end

          ##
          # @return [String] The absolute URL of the Service resource
          def url
            @properties['url']
          end

          ##
          # @return [String] The URLs of resources related to the Service
          def links
            @properties['links']
          end

          ##
          # Fetch a ServiceInstance
          # @return [ServiceInstance] Fetched ServiceInstance
          def fetch
            context.fetch
          end

          ##
          # Deletes the ServiceInstance
          # @return [Boolean] true if delete succeeds, false otherwise
          def delete
            context.delete
          end

          ##
          # Update the ServiceInstance
          # @param [String] unique_name An application-defined string that uniquely
          #   identifies the resource. This value must be 191 characters or fewer in length
          #   and be unique. **This value should not have PII.**
          # @param [String] default_ttl The default `ttl` value to set for Sessions created
          #   in the Service. The TTL (time to live) is measured in seconds after the
          #   Session's last create or last Interaction. The default value of `0` indicates an
          #   unlimited Session length. You can override a Session's default TTL value by
          #   setting its `ttl` value.
          # @param [String] callback_url The URL we should call when the interaction status
          #   changes.
          # @param [service.GeoMatchLevel] geo_match_level Where a proxy number must be
          #   located relative to the participant identifier. Can be: `country`, `area-code`,
          #   or `extended-area-code`. The default value is `country` and more specific areas
          #   than `country` are only available in North America.
          # @param [service.NumberSelectionBehavior] number_selection_behavior The
          #   preference for Proxy Number selection in the Service instance. Can be:
          #   `prefer-sticky` or `avoid-sticky` and the default is `prefer-sticky`.
          #   `prefer-sticky` means that we will try and select the same Proxy Number for a
          #   given participant if they have previous
          #   [Sessions](https://www.twilio.com/docs/proxy/api/session), but we will not fail
          #   if that Proxy Number cannot be used.  `avoid-sticky` means that we will try to
          #   use different Proxy Numbers as long as that is possible within a given pool
          #   rather than try and use a previously assigned number.
          # @param [String] intercept_callback_url The URL we call on each interaction. If
          #   we receive a 403 status, we block the interaction; otherwise the interaction
          #   continues.
          # @param [String] out_of_session_callback_url The URL we should call when an
          #   inbound call or SMS action occurs on a closed or non-existent Session. If your
          #   server (or a Twilio [function](https://www.twilio.com/functions)) responds with
          #   valid [TwiML](https://www.twilio.com/docs/voice/twiml), we will process it. This
          #   means it is possible, for example, to play a message for a call, send an
          #   automated text message response, or redirect a call to another Phone Number. See
          #   [Out-of-Session Callback Response
          #   Guide](https://www.twilio.com/docs/proxy/out-session-callback-response-guide)
          #   for more information.
          # @param [String] chat_instance_sid The SID of the Chat Service Instance managed
          #   by Proxy Service. The Chat Service enables Proxy to forward SMS and channel
          #   messages to this chat instance. This is a one-to-one relationship.
          # @return [ServiceInstance] Updated ServiceInstance
          def update(unique_name: :unset, default_ttl: :unset, callback_url: :unset, geo_match_level: :unset, number_selection_behavior: :unset, intercept_callback_url: :unset, out_of_session_callback_url: :unset, chat_instance_sid: :unset)
            context.update(
                unique_name: unique_name,
                default_ttl: default_ttl,
                callback_url: callback_url,
                geo_match_level: geo_match_level,
                number_selection_behavior: number_selection_behavior,
                intercept_callback_url: intercept_callback_url,
                out_of_session_callback_url: out_of_session_callback_url,
                chat_instance_sid: chat_instance_sid,
            )
          end

          ##
          # Access the sessions
          # @return [sessions] sessions
          def sessions
            context.sessions
          end

          ##
          # Access the phone_numbers
          # @return [phone_numbers] phone_numbers
          def phone_numbers
            context.phone_numbers
          end

          ##
          # Access the short_codes
          # @return [short_codes] short_codes
          def short_codes
            context.short_codes
          end

          ##
          # Provide a user friendly representation
          def to_s
            values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
            "<Twilio.Proxy.V1.ServiceInstance #{values}>"
          end

          ##
          # Provide a detailed, user friendly representation
          def inspect
            values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
            "<Twilio.Proxy.V1.ServiceInstance #{values}>"
          end
        end
      end
    end
  end
end