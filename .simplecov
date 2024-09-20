# frozen_string_literal: true

require 'simplecov'

SimpleCov.start 'rails' do
  add_filter %w[version.rb initializer.rb]
end
