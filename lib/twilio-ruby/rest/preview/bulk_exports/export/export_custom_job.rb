##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
#
# frozen_string_literal: true

module Twilio
  module REST
    class Preview < Domain
      class BulkExports < Version
        class ExportContext < InstanceContext
          ##
          # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
          class ExportCustomJobList < ListResource
            ##
            # Initialize the ExportCustomJobList
            # @param [Version] version Version that contains the resource
            # @param [String] resource_type The type of communication – Messages, Calls
            # @return [ExportCustomJobList] ExportCustomJobList
            def initialize(version, resource_type: nil)
              super(version)

              # Path Solution
              @solution = {resource_type: resource_type}
              @uri = "/Exports/#{@solution[:resource_type]}/Jobs"
            end

            ##
            # Lists ExportCustomJobInstance records from the API as a list.
            # Unlike stream(), this operation is eager and will load `limit` records into
            # memory before returning.
            # @param [String] next_token The token for the next page of job results, and may
            #   be null if there are no more pages
            # @param [String] previous_token The token for the previous page of results, and
            #   may be null if this is the first page
            # @param [Integer] limit Upper limit for the number of records to return. stream()
            #    guarantees to never return more than limit.  Default is no limit
            # @param [Integer] page_size Number of records to fetch per request, when
            #    not set will use the default value of 50 records.  If no page_size is defined
            #    but a limit is defined, stream() will attempt to read the limit with the most
            #    efficient page size, i.e. min(limit, 1000)
            # @return [Array] Array of up to limit results
            def list(next_token: :unset, previous_token: :unset, limit: nil, page_size: nil)
              self.stream(
                  next_token: next_token,
                  previous_token: previous_token,
                  limit: limit,
                  page_size: page_size
              ).entries
            end

            ##
            # Streams ExportCustomJobInstance records from the API as an Enumerable.
            # This operation lazily loads records as efficiently as possible until the limit
            # is reached.
            # @param [String] next_token The token for the next page of job results, and may
            #   be null if there are no more pages
            # @param [String] previous_token The token for the previous page of results, and
            #   may be null if this is the first page
            # @param [Integer] limit Upper limit for the number of records to return. stream()
            #    guarantees to never return more than limit. Default is no limit.
            # @param [Integer] page_size Number of records to fetch per request, when
            #    not set will use the default value of 50 records. If no page_size is defined
            #    but a limit is defined, stream() will attempt to read the limit with the most
            #    efficient page size, i.e. min(limit, 1000)
            # @return [Enumerable] Enumerable that will yield up to limit results
            def stream(next_token: :unset, previous_token: :unset, limit: nil, page_size: nil)
              limits = @version.read_limits(limit, page_size)

              page = self.page(
                  next_token: next_token,
                  previous_token: previous_token,
                  page_size: limits[:page_size],
              )

              @version.stream(page, limit: limits[:limit], page_limit: limits[:page_limit])
            end

            ##
            # When passed a block, yields ExportCustomJobInstance records from the API.
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
            # Retrieve a single page of ExportCustomJobInstance records from the API.
            # Request is executed immediately.
            # @param [String] next_token The token for the next page of job results, and may
            #   be null if there are no more pages
            # @param [String] previous_token The token for the previous page of results, and
            #   may be null if this is the first page
            # @param [String] page_token PageToken provided by the API
            # @param [Integer] page_number Page Number, this value is simply for client state
            # @param [Integer] page_size Number of records to return, defaults to 50
            # @return [Page] Page of ExportCustomJobInstance
            def page(next_token: :unset, previous_token: :unset, page_token: :unset, page_number: :unset, page_size: :unset)
              params = Twilio::Values.of({
                  'NextToken' => next_token,
                  'PreviousToken' => previous_token,
                  'PageToken' => page_token,
                  'Page' => page_number,
                  'PageSize' => page_size,
              })
              response = @version.page(
                  'GET',
                  @uri,
                  params
              )
              ExportCustomJobPage.new(@version, response, @solution)
            end

            ##
            # Retrieve a single page of ExportCustomJobInstance records from the API.
            # Request is executed immediately.
            # @param [String] target_url API-generated URL for the requested results page
            # @return [Page] Page of ExportCustomJobInstance
            def get_page(target_url)
              response = @version.domain.request(
                  'GET',
                  target_url
              )
              ExportCustomJobPage.new(@version, response, @solution)
            end

            ##
            # Retrieve a single page of ExportCustomJobInstance records from the API.
            # Request is executed immediately.
            # @param [String] friendly_name The friendly_name
            # @param [String] start_day The start_day
            # @param [String] end_day The end_day
            # @param [String] webhook_url The webhook_url
            # @param [String] webhook_method The webhook_method
            # @param [String] email The email
            # @return [ExportCustomJobInstance] Newly created ExportCustomJobInstance
            def create(friendly_name: :unset, start_day: :unset, end_day: :unset, webhook_url: :unset, webhook_method: :unset, email: :unset)
              data = Twilio::Values.of({
                  'FriendlyName' => friendly_name,
                  'StartDay' => start_day,
                  'EndDay' => end_day,
                  'WebhookUrl' => webhook_url,
                  'WebhookMethod' => webhook_method,
                  'Email' => email,
              })

              payload = @version.create(
                  'POST',
                  @uri,
                  data: data
              )

              ExportCustomJobInstance.new(@version, payload, resource_type: @solution[:resource_type], )
            end

            ##
            # Provide a user friendly representation
            def to_s
              '#<Twilio.Preview.BulkExports.ExportCustomJobList>'
            end
          end

          ##
          # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
          class ExportCustomJobPage < Page
            ##
            # Initialize the ExportCustomJobPage
            # @param [Version] version Version that contains the resource
            # @param [Response] response Response from the API
            # @param [Hash] solution Path solution for the resource
            # @return [ExportCustomJobPage] ExportCustomJobPage
            def initialize(version, response, solution)
              super(version, response)

              # Path Solution
              @solution = solution
            end

            ##
            # Build an instance of ExportCustomJobInstance
            # @param [Hash] payload Payload response from the API
            # @return [ExportCustomJobInstance] ExportCustomJobInstance
            def get_instance(payload)
              ExportCustomJobInstance.new(@version, payload, resource_type: @solution[:resource_type], )
            end

            ##
            # Provide a user friendly representation
            def to_s
              '<Twilio.Preview.BulkExports.ExportCustomJobPage>'
            end
          end

          ##
          # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
          class ExportCustomJobInstance < InstanceResource
            ##
            # Initialize the ExportCustomJobInstance
            # @param [Version] version Version that contains the resource
            # @param [Hash] payload payload that contains response from Twilio
            # @param [String] resource_type The type of communication – Messages, Calls
            # @return [ExportCustomJobInstance] ExportCustomJobInstance
            def initialize(version, payload, resource_type: nil)
              super(version)

              # Marshaled Properties
              @properties = {
                  'friendly_name' => payload['friendly_name'].to_json,
                  'resource_type' => payload['resource_type'].to_json,
                  'start_day' => payload['start_day'].to_json,
                  'end_day' => payload['end_day'].to_json,
                  'webhook_url' => payload['webhook_url'].to_json,
                  'webhook_method' => payload['webhook_method'].to_json,
                  'email' => payload['email'].to_json,
                  'job_sid' => payload['job_sid'],
                  'details' => payload['details'],
              }
            end

            ##
            # @return [String] The friendly name specified when creating the job
            def friendly_name
              @properties['friendly_name']
            end

            ##
            # @return [String] The type of communication – Messages, Calls
            def resource_type
              @properties['resource_type']
            end

            ##
            # @return [String] The start time for the export specified when creating the job
            def start_day
              @properties['start_day']
            end

            ##
            # @return [String] The end time for the export specified when creating the job
            def end_day
              @properties['end_day']
            end

            ##
            # @return [String] The optional webhook url called on completion
            def webhook_url
              @properties['webhook_url']
            end

            ##
            # @return [String] This is the method used to call the webhook
            def webhook_method
              @properties['webhook_method']
            end

            ##
            # @return [String] The optional email to send the completion notification to
            def email
              @properties['email']
            end

            ##
            # @return [String] The job_sid returned when the export was created
            def job_sid
              @properties['job_sid']
            end

            ##
            # @return [Hash] The details
            def details
              @properties['details']
            end

            ##
            # Provide a user friendly representation
            def to_s
              "<Twilio.Preview.BulkExports.ExportCustomJobInstance>"
            end

            ##
            # Provide a detailed, user friendly representation
            def inspect
              "<Twilio.Preview.BulkExports.ExportCustomJobInstance>"
            end
          end
        end
      end
    end
  end
end