##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
#
# frozen_string_literal: true

module Twilio
  module REST
    class FlexApi < Domain
      class V1 < Version
        class FlexFlowList < ListResource
          ##
          # Initialize the FlexFlowList
          # @param [Version] version Version that contains the resource
          # @return [FlexFlowList] FlexFlowList
          def initialize(version)
            super(version)

            # Path Solution
            @solution = {}
            @uri = "/FlexFlows"
          end

          ##
          # Lists FlexFlowInstance records from the API as a list.
          # Unlike stream(), this operation is eager and will load `limit` records into
          # memory before returning.
          # @param [String] friendly_name The `friendly_name` of the FlexFlow resources to
          #   read.
          # @param [Integer] limit Upper limit for the number of records to return. stream()
          #    guarantees to never return more than limit.  Default is no limit
          # @param [Integer] page_size Number of records to fetch per request, when
          #    not set will use the default value of 50 records.  If no page_size is defined
          #    but a limit is defined, stream() will attempt to read the limit with the most
          #    efficient page size, i.e. min(limit, 1000)
          # @return [Array] Array of up to limit results
          def list(friendly_name: :unset, limit: nil, page_size: nil)
            self.stream(friendly_name: friendly_name, limit: limit, page_size: page_size).entries
          end

          ##
          # Streams FlexFlowInstance records from the API as an Enumerable.
          # This operation lazily loads records as efficiently as possible until the limit
          # is reached.
          # @param [String] friendly_name The `friendly_name` of the FlexFlow resources to
          #   read.
          # @param [Integer] limit Upper limit for the number of records to return. stream()
          #    guarantees to never return more than limit. Default is no limit.
          # @param [Integer] page_size Number of records to fetch per request, when
          #    not set will use the default value of 50 records. If no page_size is defined
          #    but a limit is defined, stream() will attempt to read the limit with the most
          #    efficient page size, i.e. min(limit, 1000)
          # @return [Enumerable] Enumerable that will yield up to limit results
          def stream(friendly_name: :unset, limit: nil, page_size: nil)
            limits = @version.read_limits(limit, page_size)

            page = self.page(friendly_name: friendly_name, page_size: limits[:page_size], )

            @version.stream(page, limit: limits[:limit], page_limit: limits[:page_limit])
          end

          ##
          # When passed a block, yields FlexFlowInstance records from the API.
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
          # Retrieve a single page of FlexFlowInstance records from the API.
          # Request is executed immediately.
          # @param [String] friendly_name The `friendly_name` of the FlexFlow resources to
          #   read.
          # @param [String] page_token PageToken provided by the API
          # @param [Integer] page_number Page Number, this value is simply for client state
          # @param [Integer] page_size Number of records to return, defaults to 50
          # @return [Page] Page of FlexFlowInstance
          def page(friendly_name: :unset, page_token: :unset, page_number: :unset, page_size: :unset)
            params = Twilio::Values.of({
                'FriendlyName' => friendly_name,
                'PageToken' => page_token,
                'Page' => page_number,
                'PageSize' => page_size,
            })
            response = @version.page(
                'GET',
                @uri,
                params
            )
            FlexFlowPage.new(@version, response, @solution)
          end

          ##
          # Retrieve a single page of FlexFlowInstance records from the API.
          # Request is executed immediately.
          # @param [String] target_url API-generated URL for the requested results page
          # @return [Page] Page of FlexFlowInstance
          def get_page(target_url)
            response = @version.domain.request(
                'GET',
                target_url
            )
            FlexFlowPage.new(@version, response, @solution)
          end

          ##
          # Retrieve a single page of FlexFlowInstance records from the API.
          # Request is executed immediately.
          # @param [String] friendly_name A descriptive string that you create to describe
          #   the FlexFlow resource.
          # @param [String] chat_service_sid The SID of the chat service.
          # @param [flex_flow.ChannelType] channel_type The channel type. Can be: `web`,
          #   `facebook`, `sms`, `whatsapp`, `line` or `custom`.
          # @param [String] contact_identity The channel contact's Identity.
          # @param [Boolean] enabled Whether the new FlexFlow is enabled.
          # @param [flex_flow.IntegrationType] integration_type The integration type. Can
          #   be: `studio`, `external`, or `task`.
          # @param [String] integration_flow_sid The SID of the Flow when `integration_type`
          #   is `studio`.
          # @param [String] integration_url The External Webhook URL when `integration_type`
          #   is `external`.
          # @param [String] integration_workspace_sid The Workspace SID for a new task for
          #   Task `integration_type`.
          # @param [String] integration_workflow_sid The Workflow SID for a new task when
          #   `integration_type` is `task`.
          # @param [String] integration_channel The task channel for a new task when
          #   `integration_type` is `task`. The default is `default`.
          # @param [String] integration_timeout The task timeout in seconds for a new task
          #   when `integration_type` is `task`. The default is `86,400` seconds (24 hours).
          # @param [String] integration_priority The task priority of a new task when
          #   `integration_type` is `task`. The default priority is `0`.
          # @param [Boolean] integration_creation_on_message Whether to create a task when
          #   the first message arrives when `integration_type` is `task`. If `false`, the
          #   task is created with the channel.
          # @param [Boolean] long_lived Whether new channels are long-lived.
          # @param [Boolean] janitor_enabled Boolean flag for enabling or disabling the
          #   Janitor
          # @param [String] integration_retry_count The number of times to retry the webhook
          #   if the first attempt fails. Can be an integer between 0 and 3, inclusive, and
          #   the default is 0.
          # @return [FlexFlowInstance] Newly created FlexFlowInstance
          def create(friendly_name: nil, chat_service_sid: nil, channel_type: nil, contact_identity: :unset, enabled: :unset, integration_type: :unset, integration_flow_sid: :unset, integration_url: :unset, integration_workspace_sid: :unset, integration_workflow_sid: :unset, integration_channel: :unset, integration_timeout: :unset, integration_priority: :unset, integration_creation_on_message: :unset, long_lived: :unset, janitor_enabled: :unset, integration_retry_count: :unset)
            data = Twilio::Values.of({
                'FriendlyName' => friendly_name,
                'ChatServiceSid' => chat_service_sid,
                'ChannelType' => channel_type,
                'ContactIdentity' => contact_identity,
                'Enabled' => enabled,
                'IntegrationType' => integration_type,
                'Integration.FlowSid' => integration_flow_sid,
                'Integration.Url' => integration_url,
                'Integration.WorkspaceSid' => integration_workspace_sid,
                'Integration.WorkflowSid' => integration_workflow_sid,
                'Integration.Channel' => integration_channel,
                'Integration.Timeout' => integration_timeout,
                'Integration.Priority' => integration_priority,
                'Integration.CreationOnMessage' => integration_creation_on_message,
                'LongLived' => long_lived,
                'JanitorEnabled' => janitor_enabled,
                'Integration.RetryCount' => integration_retry_count,
            })

            payload = @version.create(
                'POST',
                @uri,
                data: data
            )

            FlexFlowInstance.new(@version, payload, )
          end

          ##
          # Provide a user friendly representation
          def to_s
            '#<Twilio.FlexApi.V1.FlexFlowList>'
          end
        end

        class FlexFlowPage < Page
          ##
          # Initialize the FlexFlowPage
          # @param [Version] version Version that contains the resource
          # @param [Response] response Response from the API
          # @param [Hash] solution Path solution for the resource
          # @return [FlexFlowPage] FlexFlowPage
          def initialize(version, response, solution)
            super(version, response)

            # Path Solution
            @solution = solution
          end

          ##
          # Build an instance of FlexFlowInstance
          # @param [Hash] payload Payload response from the API
          # @return [FlexFlowInstance] FlexFlowInstance
          def get_instance(payload)
            FlexFlowInstance.new(@version, payload, )
          end

          ##
          # Provide a user friendly representation
          def to_s
            '<Twilio.FlexApi.V1.FlexFlowPage>'
          end
        end

        class FlexFlowContext < InstanceContext
          ##
          # Initialize the FlexFlowContext
          # @param [Version] version Version that contains the resource
          # @param [String] sid The SID of the FlexFlow resource to fetch.
          # @return [FlexFlowContext] FlexFlowContext
          def initialize(version, sid)
            super(version)

            # Path Solution
            @solution = {sid: sid, }
            @uri = "/FlexFlows/#{@solution[:sid]}"
          end

          ##
          # Fetch a FlexFlowInstance
          # @return [FlexFlowInstance] Fetched FlexFlowInstance
          def fetch
            params = Twilio::Values.of({})

            payload = @version.fetch(
                'GET',
                @uri,
                params,
            )

            FlexFlowInstance.new(@version, payload, sid: @solution[:sid], )
          end

          ##
          # Update the FlexFlowInstance
          # @param [String] friendly_name A descriptive string that you create to describe
          #   the FlexFlow resource.
          # @param [String] chat_service_sid The SID of the chat service.
          # @param [flex_flow.ChannelType] channel_type The channel type. Can be: `web`,
          #   `facebook`, `sms`, `whatsapp`, `line` or `custom`.
          # @param [String] contact_identity The channel contact's Identity.
          # @param [Boolean] enabled Whether the FlexFlow is enabled.
          # @param [flex_flow.IntegrationType] integration_type The integration type. Can
          #   be: `studio`, `external`, or `task`.
          # @param [String] integration_flow_sid The SID of the Flow when `integration_type`
          #   is `studio`.
          # @param [String] integration_url The External Webhook URL when `integration_type`
          #   is `external`.
          # @param [String] integration_workspace_sid The Workspace SID for a new task when
          #   `integration_type` is `task`.
          # @param [String] integration_workflow_sid The Workflow SID for a new task when
          #   `integration_type` is `task`.
          # @param [String] integration_channel The task channel for a new task when
          #   `integration_type` is `task`. The default is `default`.
          # @param [String] integration_timeout The task timeout in seconds for a new task
          #   when `integration_type` is `task`. The default is `86,400` seconds (24 hours).
          # @param [String] integration_priority The task priority of a new task when
          #   `integration_type` is `task`. The default priority is `0`.
          # @param [Boolean] integration_creation_on_message Whether to create a task when
          #   the first message arrives when `integration_type` is `task`. If `false`, the
          #   task is created with the channel.
          # @param [Boolean] long_lived Whether new channels created are long-lived.
          # @param [Boolean] janitor_enabled Boolean flag for enabling or disabling the
          #   Janitor
          # @param [String] integration_retry_count The number of times to retry the webhook
          #   if the first attempt fails. Can be an integer between 0 and 3, inclusive, and
          #   the default is 0.
          # @return [FlexFlowInstance] Updated FlexFlowInstance
          def update(friendly_name: :unset, chat_service_sid: :unset, channel_type: :unset, contact_identity: :unset, enabled: :unset, integration_type: :unset, integration_flow_sid: :unset, integration_url: :unset, integration_workspace_sid: :unset, integration_workflow_sid: :unset, integration_channel: :unset, integration_timeout: :unset, integration_priority: :unset, integration_creation_on_message: :unset, long_lived: :unset, janitor_enabled: :unset, integration_retry_count: :unset)
            data = Twilio::Values.of({
                'FriendlyName' => friendly_name,
                'ChatServiceSid' => chat_service_sid,
                'ChannelType' => channel_type,
                'ContactIdentity' => contact_identity,
                'Enabled' => enabled,
                'IntegrationType' => integration_type,
                'Integration.FlowSid' => integration_flow_sid,
                'Integration.Url' => integration_url,
                'Integration.WorkspaceSid' => integration_workspace_sid,
                'Integration.WorkflowSid' => integration_workflow_sid,
                'Integration.Channel' => integration_channel,
                'Integration.Timeout' => integration_timeout,
                'Integration.Priority' => integration_priority,
                'Integration.CreationOnMessage' => integration_creation_on_message,
                'LongLived' => long_lived,
                'JanitorEnabled' => janitor_enabled,
                'Integration.RetryCount' => integration_retry_count,
            })

            payload = @version.update(
                'POST',
                @uri,
                data: data,
            )

            FlexFlowInstance.new(@version, payload, sid: @solution[:sid], )
          end

          ##
          # Deletes the FlexFlowInstance
          # @return [Boolean] true if delete succeeds, false otherwise
          def delete
            @version.delete('delete', @uri)
          end

          ##
          # Provide a user friendly representation
          def to_s
            context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
            "#<Twilio.FlexApi.V1.FlexFlowContext #{context}>"
          end

          ##
          # Provide a detailed, user friendly representation
          def inspect
            context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
            "#<Twilio.FlexApi.V1.FlexFlowContext #{context}>"
          end
        end

        class FlexFlowInstance < InstanceResource
          ##
          # Initialize the FlexFlowInstance
          # @param [Version] version Version that contains the resource
          # @param [Hash] payload payload that contains response from Twilio
          # @param [String] sid The SID of the FlexFlow resource to fetch.
          # @return [FlexFlowInstance] FlexFlowInstance
          def initialize(version, payload, sid: nil)
            super(version)

            # Marshaled Properties
            @properties = {
                'account_sid' => payload['account_sid'],
                'date_created' => Twilio.deserialize_iso8601_datetime(payload['date_created']),
                'date_updated' => Twilio.deserialize_iso8601_datetime(payload['date_updated']),
                'sid' => payload['sid'],
                'friendly_name' => payload['friendly_name'].to_json,
                'chat_service_sid' => payload['chat_service_sid'],
                'channel_type' => payload['channel_type'],
                'contact_identity' => payload['contact_identity'].to_json,
                'enabled' => payload['enabled'],
                'integration_type' => payload['integration_type'],
                'integration' => payload['integration'],
                'long_lived' => payload['long_lived'],
                'janitor_enabled' => payload['janitor_enabled'],
                'url' => payload['url'],
            }

            # Context
            @instance_context = nil
            @params = {'sid' => sid || @properties['sid'], }
          end

          ##
          # Generate an instance context for the instance, the context is capable of
          # performing various actions.  All instance actions are proxied to the context
          # @return [FlexFlowContext] FlexFlowContext for this FlexFlowInstance
          def context
            unless @instance_context
              @instance_context = FlexFlowContext.new(@version, @params['sid'], )
            end
            @instance_context
          end

          ##
          # @return [String] The SID of the Account that created the resource
          def account_sid
            @properties['account_sid']
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
          # @return [String] The unique string that identifies the resource
          def sid
            @properties['sid']
          end

          ##
          # @return [String] The string that you assigned to describe the resource
          def friendly_name
            @properties['friendly_name']
          end

          ##
          # @return [String] The SID of the chat service
          def chat_service_sid
            @properties['chat_service_sid']
          end

          ##
          # @return [flex_flow.ChannelType] The channel type
          def channel_type
            @properties['channel_type']
          end

          ##
          # @return [String] The channel contact's Identity
          def contact_identity
            @properties['contact_identity']
          end

          ##
          # @return [Boolean] Whether the FlexFlow is enabled
          def enabled
            @properties['enabled']
          end

          ##
          # @return [flex_flow.IntegrationType] The integration type
          def integration_type
            @properties['integration_type']
          end

          ##
          # @return [Hash] An object that contains specific parameters for the integration
          def integration
            @properties['integration']
          end

          ##
          # @return [Boolean] Whether new channels are long-lived
          def long_lived
            @properties['long_lived']
          end

          ##
          # @return [Boolean] Boolean flag for enabling or disabling the Janitor
          def janitor_enabled
            @properties['janitor_enabled']
          end

          ##
          # @return [String] The absolute URL of the FlexFlow resource
          def url
            @properties['url']
          end

          ##
          # Fetch a FlexFlowInstance
          # @return [FlexFlowInstance] Fetched FlexFlowInstance
          def fetch
            context.fetch
          end

          ##
          # Update the FlexFlowInstance
          # @param [String] friendly_name A descriptive string that you create to describe
          #   the FlexFlow resource.
          # @param [String] chat_service_sid The SID of the chat service.
          # @param [flex_flow.ChannelType] channel_type The channel type. Can be: `web`,
          #   `facebook`, `sms`, `whatsapp`, `line` or `custom`.
          # @param [String] contact_identity The channel contact's Identity.
          # @param [Boolean] enabled Whether the FlexFlow is enabled.
          # @param [flex_flow.IntegrationType] integration_type The integration type. Can
          #   be: `studio`, `external`, or `task`.
          # @param [String] integration_flow_sid The SID of the Flow when `integration_type`
          #   is `studio`.
          # @param [String] integration_url The External Webhook URL when `integration_type`
          #   is `external`.
          # @param [String] integration_workspace_sid The Workspace SID for a new task when
          #   `integration_type` is `task`.
          # @param [String] integration_workflow_sid The Workflow SID for a new task when
          #   `integration_type` is `task`.
          # @param [String] integration_channel The task channel for a new task when
          #   `integration_type` is `task`. The default is `default`.
          # @param [String] integration_timeout The task timeout in seconds for a new task
          #   when `integration_type` is `task`. The default is `86,400` seconds (24 hours).
          # @param [String] integration_priority The task priority of a new task when
          #   `integration_type` is `task`. The default priority is `0`.
          # @param [Boolean] integration_creation_on_message Whether to create a task when
          #   the first message arrives when `integration_type` is `task`. If `false`, the
          #   task is created with the channel.
          # @param [Boolean] long_lived Whether new channels created are long-lived.
          # @param [Boolean] janitor_enabled Boolean flag for enabling or disabling the
          #   Janitor
          # @param [String] integration_retry_count The number of times to retry the webhook
          #   if the first attempt fails. Can be an integer between 0 and 3, inclusive, and
          #   the default is 0.
          # @return [FlexFlowInstance] Updated FlexFlowInstance
          def update(friendly_name: :unset, chat_service_sid: :unset, channel_type: :unset, contact_identity: :unset, enabled: :unset, integration_type: :unset, integration_flow_sid: :unset, integration_url: :unset, integration_workspace_sid: :unset, integration_workflow_sid: :unset, integration_channel: :unset, integration_timeout: :unset, integration_priority: :unset, integration_creation_on_message: :unset, long_lived: :unset, janitor_enabled: :unset, integration_retry_count: :unset)
            context.update(
                friendly_name: friendly_name,
                chat_service_sid: chat_service_sid,
                channel_type: channel_type,
                contact_identity: contact_identity,
                enabled: enabled,
                integration_type: integration_type,
                integration_flow_sid: integration_flow_sid,
                integration_url: integration_url,
                integration_workspace_sid: integration_workspace_sid,
                integration_workflow_sid: integration_workflow_sid,
                integration_channel: integration_channel,
                integration_timeout: integration_timeout,
                integration_priority: integration_priority,
                integration_creation_on_message: integration_creation_on_message,
                long_lived: long_lived,
                janitor_enabled: janitor_enabled,
                integration_retry_count: integration_retry_count,
            )
          end

          ##
          # Deletes the FlexFlowInstance
          # @return [Boolean] true if delete succeeds, false otherwise
          def delete
            context.delete
          end

          ##
          # Provide a user friendly representation
          def to_s
            values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
            "<Twilio.FlexApi.V1.FlexFlowInstance #{values}>"
          end

          ##
          # Provide a detailed, user friendly representation
          def inspect
            values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
            "<Twilio.FlexApi.V1.FlexFlowInstance #{values}>"
          end
        end
      end
    end
  end
end