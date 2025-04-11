# frozen_string_literal: true

module RubyLLM
  module Providers
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
        ENV.fetch('OLLAMA_API_BASE', 'http://localhost:11434/v1') # SMELL: v1/api ???
      end

      def headers
        {}
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

__END__
