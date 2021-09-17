# frozen_string_literal: true

module YtDlp
  #
  # Class responsible for converting a ruby Hash into valid yt-dlp options.
  #
  class RunnerOptions
    attr_reader :options

    #
    # Initialize the runner options.
    #
    # @param [Hash] options contains the option to pass to yt-dlp
    #
    def initialize(options = {})
      @options = options
    end

    #
    # Convert the option Hash into valid yt-dlp options.
    # (key,value) pairs are transformed according to the following rules
    # * { key: value } --> '--key value'
    # * { my_key: value } --> '--my-key value'. Allow dev to keep using ruby naming conventions
    # * { key: true } --> '--key'
    # * { key: false } --> '--no-key'
    #
    # @return [String] yt-dlp options
    #
    def to_command_options
      @to_command_options ||= build_to_command_options
    end

    private

    def build_to_command_options
      options
        .map { |key, value| to_yt_dlp_option(sanitize_key(key), value.to_s) }
        .join(' ')
    end

    def to_yt_dlp_option(key, value)
      case value
      when 'true'
        "--#{key}"
      when 'false'
        "--no-#{key}"
      else
        "--#{key} #{value}"
      end
    end

    def sanitize_key(key)
      key.to_s.tr('_', '-')
    end
  end
end
