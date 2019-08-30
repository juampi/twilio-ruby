##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
#
# frozen_string_literal: true

module Twilio
  module REST
    class Chat < Domain
      class V2 < Version
        class CredentialList < ListResource
          ##
          # Initialize the CredentialList
          # @param [Version] version Version that contains the resource
          # @return [CredentialList] CredentialList
          def initialize(version)
            super(version)

            # Path Solution
            @solution = {}
            @uri = "/Credentials"
          end

          ##
          # Lists CredentialInstance records from the API as a list.
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
          # Streams CredentialInstance records from the API as an Enumerable.
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
          # When passed a block, yields CredentialInstance records from the API.
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
          # Retrieve a single page of CredentialInstance records from the API.
          # Request is executed immediately.
          # @param [String] page_token PageToken provided by the API
          # @param [Integer] page_number Page Number, this value is simply for client state
          # @param [Integer] page_size Number of records to return, defaults to 50
          # @return [Page] Page of CredentialInstance
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
            CredentialPage.new(@version, response, @solution)
          end

          ##
          # Retrieve a single page of CredentialInstance records from the API.
          # Request is executed immediately.
          # @param [String] target_url API-generated URL for the requested results page
          # @return [Page] Page of CredentialInstance
          def get_page(target_url)
            response = @version.domain.request(
                'GET',
                target_url
            )
            CredentialPage.new(@version, response, @solution)
          end

          ##
          # Retrieve a single page of CredentialInstance records from the API.
          # Request is executed immediately.
          # @param [credential.PushService] type The type of push-notification service the
          #   credential is for. Can be: `gcm`, `fcm`, or `apn`.
          # @param [String] friendly_name A descriptive string that you create to describe
          #   the new resource. It can be up to 64 characters long.
          # @param [String] certificate [APN only] The URL encoded representation of the
          #   certificate. For example,
          #   `-----BEGIN CERTIFICATE-----
          #   MIIFnTCCBIWgAwIBAgIIAjy9H849+E8wDQYJKoZIhvcNAQEFBQAwgZYxCzAJBgNV.....A==
          #   -----END CERTIFICATE-----`
          # @param [String] private_key [APN only] The URL encoded representation of the
          #   private key. For example,
          #   `-----BEGIN RSA PRIVATE KEY-----
          #   MIIEpQIBAAKCAQEAuyf/lNrH9ck8DmNyo3fGgvCI1l9s+cmBY3WIz+cUDqmxiieR.
          #   -----END RSA PRIVATE KEY-----`
          # @param [Boolean] sandbox [APN only] Whether to send the credential to sandbox
          #   APNs. Can be `true` to send to sandbox APNs or `false` to send to production.
          # @param [String] api_key [GCM only] The API key for the project that was obtained
          #   from the Google Developer console for your GCM Service application credential.
          # @param [String] secret [FCM only] The **Server key** of your project from the
          #   Firebase console, found under Settings / Cloud messaging.
          # @return [CredentialInstance] Newly created CredentialInstance
          def create(type: nil, friendly_name: :unset, certificate: :unset, private_key: :unset, sandbox: :unset, api_key: :unset, secret: :unset)
            data = Twilio::Values.of({
                'Type' => type,
                'FriendlyName' => friendly_name,
                'Certificate' => certificate,
                'PrivateKey' => private_key,
                'Sandbox' => sandbox,
                'ApiKey' => api_key,
                'Secret' => secret,
            })

            payload = @version.create(
                'POST',
                @uri,
                data: data
            )

            CredentialInstance.new(@version, payload, )
          end

          ##
          # Provide a user friendly representation
          def to_s
            '#<Twilio.Chat.V2.CredentialList>'
          end
        end

        class CredentialPage < Page
          ##
          # Initialize the CredentialPage
          # @param [Version] version Version that contains the resource
          # @param [Response] response Response from the API
          # @param [Hash] solution Path solution for the resource
          # @return [CredentialPage] CredentialPage
          def initialize(version, response, solution)
            super(version, response)

            # Path Solution
            @solution = solution
          end

          ##
          # Build an instance of CredentialInstance
          # @param [Hash] payload Payload response from the API
          # @return [CredentialInstance] CredentialInstance
          def get_instance(payload)
            CredentialInstance.new(@version, payload, )
          end

          ##
          # Provide a user friendly representation
          def to_s
            '<Twilio.Chat.V2.CredentialPage>'
          end
        end

        class CredentialContext < InstanceContext
          ##
          # Initialize the CredentialContext
          # @param [Version] version Version that contains the resource
          # @param [String] sid The Twilio-provided string that uniquely identifies the
          #   Credential resource to fetch.
          # @return [CredentialContext] CredentialContext
          def initialize(version, sid)
            super(version)

            # Path Solution
            @solution = {sid: sid, }
            @uri = "/Credentials/#{@solution[:sid]}"
          end

          ##
          # Fetch a CredentialInstance
          # @return [CredentialInstance] Fetched CredentialInstance
          def fetch
            params = Twilio::Values.of({})

            payload = @version.fetch(
                'GET',
                @uri,
                params,
            )

            CredentialInstance.new(@version, payload, sid: @solution[:sid], )
          end

          ##
          # Update the CredentialInstance
          # @param [String] friendly_name A descriptive string that you create to describe
          #   the resource. It can be up to 64 characters long.
          # @param [String] certificate [APN only] The URL encoded representation of the
          #   certificate. For example,
          #   `-----BEGIN CERTIFICATE-----
          #   MIIFnTCCBIWgAwIBAgIIAjy9H849+E8wDQYJKoZIhvcNAQEFBQAwgZYxCzAJBgNV.....A==
          #   -----END CERTIFICATE-----`
          # @param [String] private_key [APN only] The URL encoded representation of the
          #   private key. For example,
          #   `-----BEGIN RSA PRIVATE KEY-----
          #   MIIEpQIBAAKCAQEAuyf/lNrH9ck8DmNyo3fGgvCI1l9s+cmBY3WIz+cUDqmxiieR.
          #   -----END RSA PRIVATE KEY-----`
          # @param [Boolean] sandbox [APN only] Whether to send the credential to sandbox
          #   APNs. Can be `true` to send to sandbox APNs or `false` to send to production.
          # @param [String] api_key [GCM only] The API key for the project that was obtained
          #   from the Google Developer console for your GCM Service application credential.
          # @param [String] secret [FCM only] The **Server key** of your project from the
          #   Firebase console, found under Settings / Cloud messaging.
          # @return [CredentialInstance] Updated CredentialInstance
          def update(friendly_name: :unset, certificate: :unset, private_key: :unset, sandbox: :unset, api_key: :unset, secret: :unset)
            data = Twilio::Values.of({
                'FriendlyName' => friendly_name,
                'Certificate' => certificate,
                'PrivateKey' => private_key,
                'Sandbox' => sandbox,
                'ApiKey' => api_key,
                'Secret' => secret,
            })

            payload = @version.update(
                'POST',
                @uri,
                data: data,
            )

            CredentialInstance.new(@version, payload, sid: @solution[:sid], )
          end

          ##
          # Deletes the CredentialInstance
          # @return [Boolean] true if delete succeeds, false otherwise
          def delete
            @version.delete('delete', @uri)
          end

          ##
          # Provide a user friendly representation
          def to_s
            context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
            "#<Twilio.Chat.V2.CredentialContext #{context}>"
          end

          ##
          # Provide a detailed, user friendly representation
          def inspect
            context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
            "#<Twilio.Chat.V2.CredentialContext #{context}>"
          end
        end

        class CredentialInstance < InstanceResource
          ##
          # Initialize the CredentialInstance
          # @param [Version] version Version that contains the resource
          # @param [Hash] payload payload that contains response from Twilio
          # @param [String] sid The Twilio-provided string that uniquely identifies the
          #   Credential resource to fetch.
          # @return [CredentialInstance] CredentialInstance
          def initialize(version, payload, sid: nil)
            super(version)

            # Marshaled Properties
            @properties = {
                'sid' => payload['sid'],
                'account_sid' => payload['account_sid'],
                'friendly_name' => payload['friendly_name'],
                'type' => payload['type'],
                'sandbox' => payload['sandbox'],
                'date_created' => Twilio.deserialize_iso8601_datetime(payload['date_created']),
                'date_updated' => Twilio.deserialize_iso8601_datetime(payload['date_updated']),
                'url' => payload['url'],
            }

            # Context
            @instance_context = nil
            @params = {'sid' => sid || @properties['sid'], }
          end

          ##
          # Generate an instance context for the instance, the context is capable of
          # performing various actions.  All instance actions are proxied to the context
          # @return [CredentialContext] CredentialContext for this CredentialInstance
          def context
            unless @instance_context
              @instance_context = CredentialContext.new(@version, @params['sid'], )
            end
            @instance_context
          end

          ##
          # @return [String] The unique string that identifies the resource
          def sid
            @properties['sid']
          end

          ##
          # @return [String] The SID of the Account that created the resource
          def account_sid
            @properties['account_sid']
          end

          ##
          # @return [String] The string that you assigned to describe the resource
          def friendly_name
            @properties['friendly_name']
          end

          ##
          # @return [credential.PushService] The type of push-notification service the credential is for
          def type
            @properties['type']
          end

          ##
          # @return [String] [APN only] Whether to send the credential to sandbox APNs
          def sandbox
            @properties['sandbox']
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
          # @return [String] The absolute URL of the Credential resource
          def url
            @properties['url']
          end

          ##
          # Fetch a CredentialInstance
          # @return [CredentialInstance] Fetched CredentialInstance
          def fetch
            context.fetch
          end

          ##
          # Update the CredentialInstance
          # @param [String] friendly_name A descriptive string that you create to describe
          #   the resource. It can be up to 64 characters long.
          # @param [String] certificate [APN only] The URL encoded representation of the
          #   certificate. For example,
          #   `-----BEGIN CERTIFICATE-----
          #   MIIFnTCCBIWgAwIBAgIIAjy9H849+E8wDQYJKoZIhvcNAQEFBQAwgZYxCzAJBgNV.....A==
          #   -----END CERTIFICATE-----`
          # @param [String] private_key [APN only] The URL encoded representation of the
          #   private key. For example,
          #   `-----BEGIN RSA PRIVATE KEY-----
          #   MIIEpQIBAAKCAQEAuyf/lNrH9ck8DmNyo3fGgvCI1l9s+cmBY3WIz+cUDqmxiieR.
          #   -----END RSA PRIVATE KEY-----`
          # @param [Boolean] sandbox [APN only] Whether to send the credential to sandbox
          #   APNs. Can be `true` to send to sandbox APNs or `false` to send to production.
          # @param [String] api_key [GCM only] The API key for the project that was obtained
          #   from the Google Developer console for your GCM Service application credential.
          # @param [String] secret [FCM only] The **Server key** of your project from the
          #   Firebase console, found under Settings / Cloud messaging.
          # @return [CredentialInstance] Updated CredentialInstance
          def update(friendly_name: :unset, certificate: :unset, private_key: :unset, sandbox: :unset, api_key: :unset, secret: :unset)
            context.update(
                friendly_name: friendly_name,
                certificate: certificate,
                private_key: private_key,
                sandbox: sandbox,
                api_key: api_key,
                secret: secret,
            )
          end

          ##
          # Deletes the CredentialInstance
          # @return [Boolean] true if delete succeeds, false otherwise
          def delete
            context.delete
          end

          ##
          # Provide a user friendly representation
          def to_s
            values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
            "<Twilio.Chat.V2.CredentialInstance #{values}>"
          end

          ##
          # Provide a detailed, user friendly representation
          def inspect
            values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
            "<Twilio.Chat.V2.CredentialInstance #{values}>"
          end
        end
      end
    end
  end
end