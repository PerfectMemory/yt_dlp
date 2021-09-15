# frozen_string_literal: true

module YtDlp
  #
  # Contains utility methods used in the project.
  #
  module Utils
    #
    # Surround the string representation of the input with double quotes.
    #
    # @param [String] input Raw string
    #
    # @return [String] Quoted string
    #
    def self.quoted(input)
      "\"#{input}\""
    end
  end
end
