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
        class ServiceContext < InstanceContext
          class ChannelContext < InstanceContext
            class MessageList < ListResource
              ##
              # Initialize the MessageList
              # @param [Version] version Version that contains the resource
              # @param [String] service_sid The SID of the
              #   [Service](https://www.twilio.com/docs/chat/rest/service-resource) the Message
              #   resource is associated with.
              # @param [String] channel_sid The SID of the
              #   [Channel](https://www.twilio.com/docs/chat/channels) the Message resource
              #   belongs to.
              # @return [MessageList] MessageList
              def initialize(version, service_sid: nil, channel_sid: nil)
                super(version)

                # Path Solution
                @solution = {service_sid: service_sid, channel_sid: channel_sid}
                @uri = "/Services/#{@solution[:service_sid]}/Channels/#{@solution[:channel_sid]}/Messages"
              end

              ##
              # Retrieve a single page of MessageInstance records from the API.
              # Request is executed immediately.
              # @param [String] from The [Identity](https://www.twilio.com/docs/chat/identity)
              #   of the new message's author. The default value is `system`.
              # @param [String] attributes A valid JSON string that contains
              #   application-specific data.
              # @param [Time] date_created The date, specified in [ISO
              #   8601](https://en.wikipedia.org/wiki/ISO_8601) format, to assign to the resource
              #   as the date it was created. The default value is the current time set by the
              #   Chat service. This parameter should only be used when a Chat's history is being
              #   recreated from a backup/separate source.
              # @param [Time] date_updated The date, specified in [ISO
              #   8601](https://en.wikipedia.org/wiki/ISO_8601) format, to assign to the resource
              #   as the date it was last updated.
              # @param [String] last_updated_by The
              #   [Identity](https://www.twilio.com/docs/chat/identity) of the User who last
              #   updated the Message, if applicable.
              # @param [String] body The message to send to the channel. Can be an empty string
              #   or `null`, which sets the value as an empty string. You can send structured data
              #   in the body by serializing it as a string.
              # @param [String] media_sid The SID of the
              #   [Media](https://www.twilio.com/docs/chat/rest/media) to attach to the new
              #   Message.
              # @return [MessageInstance] Newly created MessageInstance
              def create(from: :unset, attributes: :unset, date_created: :unset, date_updated: :unset, last_updated_by: :unset, body: :unset, media_sid: :unset)
                data = Twilio::Values.of({
                    'From' => from,
                    'Attributes' => attributes,
                    'DateCreated' => Twilio.serialize_iso8601_datetime(date_created),
                    'DateUpdated' => Twilio.serialize_iso8601_datetime(date_updated),
                    'LastUpdatedBy' => last_updated_by,
                    'Body' => body,
                    'MediaSid' => media_sid,
                })

                payload = @version.create(
                    'POST',
                    @uri,
                    data: data
                )

                MessageInstance.new(
                    @version,
                    payload,
                    service_sid: @solution[:service_sid],
                    channel_sid: @solution[:channel_sid],
                )
              end

              ##
              # Lists MessageInstance records from the API as a list.
              # Unlike stream(), this operation is eager and will load `limit` records into
              # memory before returning.
              # @param [message.OrderType] order The sort order of the returned messages. Can
              #   be: `asc` (ascending) or `desc` (descending) with `asc` as the default.
              # @param [Integer] limit Upper limit for the number of records to return. stream()
              #    guarantees to never return more than limit.  Default is no limit
              # @param [Integer] page_size Number of records to fetch per request, when
              #    not set will use the default value of 50 records.  If no page_size is defined
              #    but a limit is defined, stream() will attempt to read the limit with the most
              #    efficient page size, i.e. min(limit, 1000)
              # @return [Array] Array of up to limit results
              def list(order: :unset, limit: nil, page_size: nil)
                self.stream(order: order, limit: limit, page_size: page_size).entries
              end

              ##
              # Streams MessageInstance records from the API as an Enumerable.
              # This operation lazily loads records as efficiently as possible until the limit
              # is reached.
              # @param [message.OrderType] order The sort order of the returned messages. Can
              #   be: `asc` (ascending) or `desc` (descending) with `asc` as the default.
              # @param [Integer] limit Upper limit for the number of records to return. stream()
              #    guarantees to never return more than limit. Default is no limit.
              # @param [Integer] page_size Number of records to fetch per request, when
              #    not set will use the default value of 50 records. If no page_size is defined
              #    but a limit is defined, stream() will attempt to read the limit with the most
              #    efficient page size, i.e. min(limit, 1000)
              # @return [Enumerable] Enumerable that will yield up to limit results
              def stream(order: :unset, limit: nil, page_size: nil)
                limits = @version.read_limits(limit, page_size)

                page = self.page(order: order, page_size: limits[:page_size], )

                @version.stream(page, limit: limits[:limit], page_limit: limits[:page_limit])
              end

              ##
              # When passed a block, yields MessageInstance records from the API.
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
              # Retrieve a single page of MessageInstance records from the API.
              # Request is executed immediately.
              # @param [message.OrderType] order The sort order of the returned messages. Can
              #   be: `asc` (ascending) or `desc` (descending) with `asc` as the default.
              # @param [String] page_token PageToken provided by the API
              # @param [Integer] page_number Page Number, this value is simply for client state
              # @param [Integer] page_size Number of records to return, defaults to 50
              # @return [Page] Page of MessageInstance
              def page(order: :unset, page_token: :unset, page_number: :unset, page_size: :unset)
                params = Twilio::Values.of({
                    'Order' => order,
                    'PageToken' => page_token,
                    'Page' => page_number,
                    'PageSize' => page_size,
                })
                response = @version.page(
                    'GET',
                    @uri,
                    params
                )
                MessagePage.new(@version, response, @solution)
              end

              ##
              # Retrieve a single page of MessageInstance records from the API.
              # Request is executed immediately.
              # @param [String] target_url API-generated URL for the requested results page
              # @return [Page] Page of MessageInstance
              def get_page(target_url)
                response = @version.domain.request(
                    'GET',
                    target_url
                )
                MessagePage.new(@version, response, @solution)
              end

              ##
              # Provide a user friendly representation
              def to_s
                '#<Twilio.Chat.V2.MessageList>'
              end
            end

            class MessagePage < Page
              ##
              # Initialize the MessagePage
              # @param [Version] version Version that contains the resource
              # @param [Response] response Response from the API
              # @param [Hash] solution Path solution for the resource
              # @return [MessagePage] MessagePage
              def initialize(version, response, solution)
                super(version, response)

                # Path Solution
                @solution = solution
              end

              ##
              # Build an instance of MessageInstance
              # @param [Hash] payload Payload response from the API
              # @return [MessageInstance] MessageInstance
              def get_instance(payload)
                MessageInstance.new(
                    @version,
                    payload,
                    service_sid: @solution[:service_sid],
                    channel_sid: @solution[:channel_sid],
                )
              end

              ##
              # Provide a user friendly representation
              def to_s
                '<Twilio.Chat.V2.MessagePage>'
              end
            end

            class MessageContext < InstanceContext
              ##
              # Initialize the MessageContext
              # @param [Version] version Version that contains the resource
              # @param [String] service_sid The SID of the
              #   [Service](https://www.twilio.com/docs/chat/rest/service-resource) to fetch the
              #   Message resource from.
              # @param [String] channel_sid The SID of the
              #   [Channel](https://www.twilio.com/docs/chat/channels) the Message resource to
              #   fetch belongs to. This value can be the Channel resource's `sid` or
              #   `unique_name`.
              # @param [String] sid The SID of the Message resource to fetch.
              # @return [MessageContext] MessageContext
              def initialize(version, service_sid, channel_sid, sid)
                super(version)

                # Path Solution
                @solution = {service_sid: service_sid, channel_sid: channel_sid, sid: sid, }
                @uri = "/Services/#{@solution[:service_sid]}/Channels/#{@solution[:channel_sid]}/Messages/#{@solution[:sid]}"
              end

              ##
              # Fetch a MessageInstance
              # @return [MessageInstance] Fetched MessageInstance
              def fetch
                params = Twilio::Values.of({})

                payload = @version.fetch(
                    'GET',
                    @uri,
                    params,
                )

                MessageInstance.new(
                    @version,
                    payload,
                    service_sid: @solution[:service_sid],
                    channel_sid: @solution[:channel_sid],
                    sid: @solution[:sid],
                )
              end

              ##
              # Deletes the MessageInstance
              # @return [Boolean] true if delete succeeds, false otherwise
              def delete
                @version.delete('delete', @uri)
              end

              ##
              # Update the MessageInstance
              # @param [String] body The message to send to the channel. Can be an empty string
              #   or `null`, which sets the value as an empty string. You can send structured data
              #   in the body by serializing it as a string.
              # @param [String] attributes A valid JSON string that contains
              #   application-specific data.
              # @param [Time] date_created The date, specified in [ISO
              #   8601](https://en.wikipedia.org/wiki/ISO_8601) format, to assign to the resource
              #   as the date it was created. The default value is the current time set by the
              #   Chat service. This parameter should only be used when a Chat's history is being
              #   recreated from a backup/separate source.
              # @param [Time] date_updated The date, specified in [ISO
              #   8601](https://en.wikipedia.org/wiki/ISO_8601) format, to assign to the resource
              #   as the date it was last updated.
              # @param [String] last_updated_by The
              #   [Identity](https://www.twilio.com/docs/chat/identity) of the User who last
              #   updated the Message, if applicable.
              # @param [String] from The [Identity](https://www.twilio.com/docs/chat/identity)
              #   of the message's author.
              # @return [MessageInstance] Updated MessageInstance
              def update(body: :unset, attributes: :unset, date_created: :unset, date_updated: :unset, last_updated_by: :unset, from: :unset)
                data = Twilio::Values.of({
                    'Body' => body,
                    'Attributes' => attributes,
                    'DateCreated' => Twilio.serialize_iso8601_datetime(date_created),
                    'DateUpdated' => Twilio.serialize_iso8601_datetime(date_updated),
                    'LastUpdatedBy' => last_updated_by,
                    'From' => from,
                })

                payload = @version.update(
                    'POST',
                    @uri,
                    data: data,
                )

                MessageInstance.new(
                    @version,
                    payload,
                    service_sid: @solution[:service_sid],
                    channel_sid: @solution[:channel_sid],
                    sid: @solution[:sid],
                )
              end

              ##
              # Provide a user friendly representation
              def to_s
                context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
                "#<Twilio.Chat.V2.MessageContext #{context}>"
              end

              ##
              # Provide a detailed, user friendly representation
              def inspect
                context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
                "#<Twilio.Chat.V2.MessageContext #{context}>"
              end
            end

            class MessageInstance < InstanceResource
              ##
              # Initialize the MessageInstance
              # @param [Version] version Version that contains the resource
              # @param [Hash] payload payload that contains response from Twilio
              # @param [String] service_sid The SID of the
              #   [Service](https://www.twilio.com/docs/chat/rest/service-resource) the Message
              #   resource is associated with.
              # @param [String] channel_sid The SID of the
              #   [Channel](https://www.twilio.com/docs/chat/channels) the Message resource
              #   belongs to.
              # @param [String] sid The SID of the Message resource to fetch.
              # @return [MessageInstance] MessageInstance
              def initialize(version, payload, service_sid: nil, channel_sid: nil, sid: nil)
                super(version)

                # Marshaled Properties
                @properties = {
                    'sid' => payload['sid'],
                    'account_sid' => payload['account_sid'],
                    'attributes' => payload['attributes'].to_json,
                    'service_sid' => payload['service_sid'],
                    'to' => payload['to'],
                    'channel_sid' => payload['channel_sid'],
                    'date_created' => Twilio.deserialize_iso8601_datetime(payload['date_created']),
                    'date_updated' => Twilio.deserialize_iso8601_datetime(payload['date_updated']),
                    'last_updated_by' => payload['last_updated_by'].to_json,
                    'was_edited' => payload['was_edited'],
                    'from' => payload['from'].to_json,
                    'body' => payload['body'].to_json,
                    'index' => payload['index'].to_i,
                    'type' => payload['type'].to_json,
                    'media' => payload['media'],
                    'url' => payload['url'],
                }

                # Context
                @instance_context = nil
                @params = {
                    'service_sid' => service_sid,
                    'channel_sid' => channel_sid,
                    'sid' => sid || @properties['sid'],
                }
              end

              ##
              # Generate an instance context for the instance, the context is capable of
              # performing various actions.  All instance actions are proxied to the context
              # @return [MessageContext] MessageContext for this MessageInstance
              def context
                unless @instance_context
                  @instance_context = MessageContext.new(
                      @version,
                      @params['service_sid'],
                      @params['channel_sid'],
                      @params['sid'],
                  )
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
              # @return [String] The JSON string that stores application-specific data
              def attributes
                @properties['attributes']
              end

              ##
              # @return [String] The SID of the Service that the resource is associated with
              def service_sid
                @properties['service_sid']
              end

              ##
              # @return [String] The SID of the Channel that the message was sent to
              def to
                @properties['to']
              end

              ##
              # @return [String] The SID of the Channel the Message resource belongs to
              def channel_sid
                @properties['channel_sid']
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
              # @return [String] The Identity of the User who last updated the Message
              def last_updated_by
                @properties['last_updated_by']
              end

              ##
              # @return [Boolean] Whether the message has been edited since  it was created
              def was_edited
                @properties['was_edited']
              end

              ##
              # @return [String] The Identity of the message's author
              def from
                @properties['from']
              end

              ##
              # @return [String] The content of the message
              def body
                @properties['body']
              end

              ##
              # @return [String] The index of the message within the Channel
              def index
                @properties['index']
              end

              ##
              # @return [String] The Message type
              def type
                @properties['type']
              end

              ##
              # @return [Hash] A Media object that describes the Message's media if attached; otherwise, null
              def media
                @properties['media']
              end

              ##
              # @return [String] The absolute URL of the Message resource
              def url
                @properties['url']
              end

              ##
              # Fetch a MessageInstance
              # @return [MessageInstance] Fetched MessageInstance
              def fetch
                context.fetch
              end

              ##
              # Deletes the MessageInstance
              # @return [Boolean] true if delete succeeds, false otherwise
              def delete
                context.delete
              end

              ##
              # Update the MessageInstance
              # @param [String] body The message to send to the channel. Can be an empty string
              #   or `null`, which sets the value as an empty string. You can send structured data
              #   in the body by serializing it as a string.
              # @param [String] attributes A valid JSON string that contains
              #   application-specific data.
              # @param [Time] date_created The date, specified in [ISO
              #   8601](https://en.wikipedia.org/wiki/ISO_8601) format, to assign to the resource
              #   as the date it was created. The default value is the current time set by the
              #   Chat service. This parameter should only be used when a Chat's history is being
              #   recreated from a backup/separate source.
              # @param [Time] date_updated The date, specified in [ISO
              #   8601](https://en.wikipedia.org/wiki/ISO_8601) format, to assign to the resource
              #   as the date it was last updated.
              # @param [String] last_updated_by The
              #   [Identity](https://www.twilio.com/docs/chat/identity) of the User who last
              #   updated the Message, if applicable.
              # @param [String] from The [Identity](https://www.twilio.com/docs/chat/identity)
              #   of the message's author.
              # @return [MessageInstance] Updated MessageInstance
              def update(body: :unset, attributes: :unset, date_created: :unset, date_updated: :unset, last_updated_by: :unset, from: :unset)
                context.update(
                    body: body,
                    attributes: attributes,
                    date_created: date_created,
                    date_updated: date_updated,
                    last_updated_by: last_updated_by,
                    from: from,
                )
              end

              ##
              # Provide a user friendly representation
              def to_s
                values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
                "<Twilio.Chat.V2.MessageInstance #{values}>"
              end

              ##
              # Provide a detailed, user friendly representation
              def inspect
                values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
                "<Twilio.Chat.V2.MessageInstance #{values}>"
              end
            end
          end
        end
      end
    end
  end
end