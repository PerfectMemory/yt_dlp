# frozen_string_literal: true

module YtDlp
  class ModelBase < Dry::Struct
    schema schema.strict

    transform_keys(&:to_sym)

    transform_types do |type|
      if type.default?
        type.constructor do |value|
          value.nil? ? Dry::Types::Undefined : value
        end
      else
        type
      end
    end
  end
end
