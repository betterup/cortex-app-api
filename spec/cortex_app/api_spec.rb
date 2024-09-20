# frozen_string_literal: true

require 'cortex_app'

RSpec.describe CortexApp::Api do
  describe '#initialize' do
    subject(:api) { described_class.new(bearer_token: bearer_token) }

    let(:bearer_token) { 'mycortextoken' }

    context 'when building the header' do
      it 'builds the header correctly' do
        expect(api.send(:headers)).to eq(
          { 'Content-Type' => 'application/json', 'Authorization' => "Bearer #{bearer_token}" }
        )
      end
    end
  end
end
