# frozen_string_literal: true

module RubyLLM
  module Providers
    module Ollama
      module Models
        module_function

        def models_url
          'tags'  # SMELL: api/tags ??
        end

        def parse_list_models_response(response, slug, capabilities) # rubocop:disable Metrics/AbcSize,Metrics/MethodLength
          (response.body['data'] || []).map do |model|
            ModelInfo.new(

              {
                'id'            => model['name'],
                'name'          => model['name'],
                'size'          => model['details']['parameter_size'],
                'quantization'  => model['details']['quantization_level'],
                'modified_at'   => model['modified_at']
              }




              # id: model['id'],
              # created_at: model['created'] ? Time.at(model['created']) : nil,
              # display_name: capabilities.format_display_name(model['id']),
              # provider: slug,
              # type: capabilities.model_type(model['id']),
              # family: capabilities.model_family(model['id']),
              # metadata: {
              #   object: model['object'],
              #   owned_by: model['owned_by']
              # },
              # context_window: capabilities.context_window_for(model['id']),
              # max_tokens: capabilities.max_tokens_for(model['id']),
              # supports_vision: capabilities.supports_vision?(model['id']),
              # supports_functions: capabilities.supports_functions?(model['id']),
              # supports_json_mode: capabilities.supports_json_mode?(model['id']),
              # input_price_per_million: capabilities.input_price_for(model['id']),
              # output_price_per_million: capabilities.output_price_for(model['id'])



            )
          end
        end
      end
    end
  end
end

__END__


This is the JSON format returned by the Ollama API end point tags

{
"models": [
  {
    "name": "codellama:13b",
    "modified_at": "2023-11-04T14:56:49.277302595-07:00",
    "size": 7365960935,
    "digest": "9f438cb9cd581fc025612d27f7c1a6669ff83a8bb0ed86c94fcf4c5440555697",
    "details": {
      "format": "gguf",
      "family": "llama",
      "families": null,
      "parameter_size": "13B",
      "quantization_level": "Q4_0"
    }
  },
  {
    "name": "llama3:latest",
    "modified_at": "2023-12-07T09:32:18.757212583-08:00",
    "size": 3825819519,
    "digest": "fe938a131f40e6f6d40083c9f0f430a515233eb2edaa6d72eb85c50d64f2300e",
    "details": {
      "format": "gguf",
      "family": "llama",
      "families": null,
      "parameter_size": "7B",
      "quantization_level": "Q4_0"
    }
  }
]
}
