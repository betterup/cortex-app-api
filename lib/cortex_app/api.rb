# frozen_string_literal: true

require 'httparty'

module CortexApp
  # Base class for Cortex API classes
  class Api
    API_URL = 'https://api.getcortexapp.com/api/v1'

    # @param bearer_token [String] the bearer token to authenticate with Cortex
    def initialize(bearer_token:) = @bearer_token = bearer_token

    private

    def http_post(path:, data:)
      HTTParty.post("#{API_URL}/#{path}", headers: headers, body: data.to_json)
    end

    def http_put(path:, data:)
      HTTParty.put("#{API_URL}/#{path}", headers: headers, body: data.to_json)
    end

    def headers
      @headers ||= { 'Content-Type' => 'application/json', 'Authorization' => "Bearer #{@bearer_token}" }
    end
  end
end
