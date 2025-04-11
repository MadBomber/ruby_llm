# frozen_string_literal: true

module RubyLLM
  module Providers
    # OpenAI API integration. Handles chat completion, function calling,
    # and OpenAI's unique streaming format. Supports GPT-4, GPT-3.5,
    # and other OpenAI models.
    module Ollama
      extend Providers::OpenAI

      def self.extended(base)
        base.extend(Provider)
        base.extend(OpenAI::Chat)
        base.extend(OpenAI::Embeddings)
        base.extend(OpenAI::Models)
        base.extend(OpenAI::Streaming)
        base.extend(OpenAI::Tools)
        base.extend(OpenAI::Images)
        base.extend(OpenAI::Media)
      end

      module_function

      def api_base
        ENV.fetch('OLLAMA_HOST', 'http://localhost:11434')
      end

      def headers
        {}
      end

      def capabilities
        OpenAI::Capabilities
      end

      def slug
        'ollama'
      end

      def configuration_requirements
        []
      end
    end
  end
end
