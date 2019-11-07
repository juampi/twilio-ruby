##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
#
# frozen_string_literal: true

module Twilio
  module REST
    class Api < Domain
      class V2010 < Version
        class AccountContext < InstanceContext
          class SigningKeyList < ListResource
            ##
            # Initialize the SigningKeyList
            # @param [Version] version Version that contains the resource
            # @param [String] account_sid A 34 character string that uniquely identifies this
            #   resource.
            # @return [SigningKeyList] SigningKeyList
            def initialize(version, account_sid: nil)
              super(version)

              # Path Solution
              @solution = {account_sid: account_sid}
              @uri = "/Accounts/#{@solution[:account_sid]}/SigningKeys.json"
            end

            ##
            # Lists SigningKeyInstance records from the API as a list.
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
            # Streams SigningKeyInstance records from the API as an Enumerable.
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
            # When passed a block, yields SigningKeyInstance records from the API.
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
            # Retrieve a single page of SigningKeyInstance records from the API.
            # Request is executed immediately.
            # @param [String] page_token PageToken provided by the API
            # @param [Integer] page_number Page Number, this value is simply for client state
            # @param [Integer] page_size Number of records to return, defaults to 50
            # @return [Page] Page of SigningKeyInstance
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
              SigningKeyPage.new(@version, response, @solution)
            end

            ##
            # Retrieve a single page of SigningKeyInstance records from the API.
            # Request is executed immediately.
            # @param [String] target_url API-generated URL for the requested results page
            # @return [Page] Page of SigningKeyInstance
            def get_page(target_url)
              response = @version.domain.request(
                  'GET',
                  target_url
              )
              SigningKeyPage.new(@version, response, @solution)
            end

            ##
            # Provide a user friendly representation
            def to_s
              '#<Twilio.Api.V2010.SigningKeyList>'
            end
          end

          class SigningKeyPage < Page
            ##
            # Initialize the SigningKeyPage
            # @param [Version] version Version that contains the resource
            # @param [Response] response Response from the API
            # @param [Hash] solution Path solution for the resource
            # @return [SigningKeyPage] SigningKeyPage
            def initialize(version, response, solution)
              super(version, response)

              # Path Solution
              @solution = solution
            end

            ##
            # Build an instance of SigningKeyInstance
            # @param [Hash] payload Payload response from the API
            # @return [SigningKeyInstance] SigningKeyInstance
            def get_instance(payload)
              SigningKeyInstance.new(@version, payload, account_sid: @solution[:account_sid], )
            end

            ##
            # Provide a user friendly representation
            def to_s
              '<Twilio.Api.V2010.SigningKeyPage>'
            end
          end

          class SigningKeyContext < InstanceContext
            ##
            # Initialize the SigningKeyContext
            # @param [Version] version Version that contains the resource
            # @param [String] account_sid The account_sid
            # @param [String] sid The sid
            # @return [SigningKeyContext] SigningKeyContext
            def initialize(version, account_sid, sid)
              super(version)

              # Path Solution
              @solution = {account_sid: account_sid, sid: sid, }
              @uri = "/Accounts/#{@solution[:account_sid]}/SigningKeys/#{@solution[:sid]}.json"
            end

            ##
            # Fetch a SigningKeyInstance
            # @return [SigningKeyInstance] Fetched SigningKeyInstance
            def fetch
              params = Twilio::Values.of({})

              payload = @version.fetch(
                  'GET',
                  @uri,
                  params,
              )

              SigningKeyInstance.new(
                  @version,
                  payload,
                  account_sid: @solution[:account_sid],
                  sid: @solution[:sid],
              )
            end

            ##
            # Update the SigningKeyInstance
            # @param [String] friendly_name The friendly_name
            # @return [SigningKeyInstance] Updated SigningKeyInstance
            def update(friendly_name: :unset)
              data = Twilio::Values.of({'FriendlyName' => friendly_name, })

              payload = @version.update(
                  'POST',
                  @uri,
                  data: data,
              )

              SigningKeyInstance.new(
                  @version,
                  payload,
                  account_sid: @solution[:account_sid],
                  sid: @solution[:sid],
              )
            end

            ##
            # Deletes the SigningKeyInstance
            # @return [Boolean] true if delete succeeds, false otherwise
            def delete
              @version.delete('delete', @uri)
            end

            ##
            # Provide a user friendly representation
            def to_s
              context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
              "#<Twilio.Api.V2010.SigningKeyContext #{context}>"
            end

            ##
            # Provide a detailed, user friendly representation
            def inspect
              context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
              "#<Twilio.Api.V2010.SigningKeyContext #{context}>"
            end
          end

          class SigningKeyInstance < InstanceResource
            ##
            # Initialize the SigningKeyInstance
            # @param [Version] version Version that contains the resource
            # @param [Hash] payload payload that contains response from Twilio
            # @param [String] account_sid A 34 character string that uniquely identifies this
            #   resource.
            # @param [String] sid The sid
            # @return [SigningKeyInstance] SigningKeyInstance
            def initialize(version, payload, account_sid: nil, sid: nil)
              super(version)

              # Marshaled Properties
              @properties = {
                  'sid' => payload['sid'],
                  'friendly_name' => payload['friendly_name'].to_json,
                  'date_created' => Twilio.deserialize_rfc2822(payload['date_created']),
                  'date_updated' => Twilio.deserialize_rfc2822(payload['date_updated']),
              }

              # Context
              @instance_context = nil
              @params = {'account_sid' => account_sid, 'sid' => sid || @properties['sid'], }
            end

            ##
            # Generate an instance context for the instance, the context is capable of
            # performing various actions.  All instance actions are proxied to the context
            # @return [SigningKeyContext] SigningKeyContext for this SigningKeyInstance
            def context
              unless @instance_context
                @instance_context = SigningKeyContext.new(@version, @params['account_sid'], @params['sid'], )
              end
              @instance_context
            end

            ##
            # @return [String] The sid
            def sid
              @properties['sid']
            end

            ##
            # @return [String] The friendly_name
            def friendly_name
              @properties['friendly_name']
            end

            ##
            # @return [Time] The date_created
            def date_created
              @properties['date_created']
            end

            ##
            # @return [Time] The date_updated
            def date_updated
              @properties['date_updated']
            end

            ##
            # Fetch a SigningKeyInstance
            # @return [SigningKeyInstance] Fetched SigningKeyInstance
            def fetch
              context.fetch
            end

            ##
            # Update the SigningKeyInstance
            # @param [String] friendly_name The friendly_name
            # @return [SigningKeyInstance] Updated SigningKeyInstance
            def update(friendly_name: :unset)
              context.update(friendly_name: friendly_name, )
            end

            ##
            # Deletes the SigningKeyInstance
            # @return [Boolean] true if delete succeeds, false otherwise
            def delete
              context.delete
            end

            ##
            # Provide a user friendly representation
            def to_s
              values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
              "<Twilio.Api.V2010.SigningKeyInstance #{values}>"
            end

            ##
            # Provide a detailed, user friendly representation
            def inspect
              values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
              "<Twilio.Api.V2010.SigningKeyInstance #{values}>"
            end
          end
        end
      end
    end
  end
end