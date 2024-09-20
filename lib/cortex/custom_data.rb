# frozen_string_literal: true

module Cortex
  # API client to interact with Cortex [custom data](https://docs.cortex.io/docs/reference/basics/custom-data)
  class CustomData < Api
    # POSTs custom data to Cortex for a specific entity
    #
    # @param entity_tag [String] the entity tag in Cortex
    # @param data [Hash] the custom data to POST
    def post(entity_tag:, data:)
      http_post(path: post_path(entity_tag), data: data)
    end

    # Bulk PUTs custom data to Cortex for multiple entities
    #
    # @param data [Hash] the custom data to PUT
    def put_bulk(data:)
      http_put(path: 'catalog/custom-data', data: data)
    end

    private

    def post_path(entity_tag)
      "catalog/#{entity_tag}/custom-data"
    end
  end
end
