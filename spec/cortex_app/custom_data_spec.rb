# frozen_string_literal: true

require 'cortex_app'

RSpec.describe CortexApp::CustomData,
               vcr: { cassette_name: 'cortex/custom_data', allow_unused_http_interactions: true } do
  subject(:api) { described_class.new(bearer_token: bearer_token) }

  let(:bearer_token) { 'CORTEX_TOKEN' }

  describe '#post' do
    context 'when posting custom data' do
      let(:custom_data) { { key: 'code-ownership', value: 22.94, description: 'Percentage of files with ownership' } }

      it 'successfully posts custom data to cortex' do
        expect(api.post(entity_tag: 'betterup-monolith', data: custom_data).parsed_response).to eq(
          {
            'id' => 379_921,
            'key' => 'code-ownership',
            'value' => 22.94,
            'source' => 'API',
            'dateUpdated' => '2022-12-19T23:45:46.922281',
            'description' => 'Percentage of files with ownership'
          }
        )
      end
    end
  end

  describe '#put_bulk' do
    context 'when posting custom data' do
      let(:custom_data) do
        {
          values: {
            'betterup-monolith' => [
              { key: 'code-ownership', value: 22.94, description: 'Percentage of files with ownership' },
              { key: 'system-ownership', value: 52, description: 'Number of systems with ownership' }
            ]
          }
        }
      end

      it 'successfully posts custom data to cortex' do
        expect(api.put_bulk(data: custom_data).parsed_response).to eq(
          {
            'values' => [
              {
                'id' => 379_921,
                'key' => 'code-ownership',
                'value' => 22.94,
                'source' => 'API',
                'dateUpdated' => '2022-12-19T23:45:46.922281',
                'description' => 'Percentage of files with ownership'
              },
              {
                'id' => 388_281,
                'key' => 'system-ownership',
                'value' => 52,
                'source' => 'API',
                'dateUpdated' => '2022-12-19T23:30:56.396648',
                'description' => 'Number of systems with ownership'
              }
            ]
          }
        )
      end
    end
  end
end
