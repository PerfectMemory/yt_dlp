# frozen_string_literal: true

module YtDlp
  #
  # Data model for a video accessed from an URL
  #
  class Video < ModelBase
    # Required to get informations about the downloaded video
    MANDATORY_OPTIONS = {
      dump_json: true,
      simulate: false
    }.freeze

    # Optimisation purpose. Do not download the video if you only need information
    INFORMATION_OPTIONS = MANDATORY_OPTIONS.merge(skip_download: true).freeze
    # Download URL.
    #
    # @!attribute [r] url
    #   @return [Types::String]
    attribute :url, Types::String
    # Attributes passed to the executable in a Ruby Hash format
    #
    #
    # @!attribute [r] options
    #   @return [Types::Hash.optional.defaut({})]
    attribute? :options, Types::Hash.optional.default({}.freeze)

    def download
      @information = run_with_options(options.merge(MANDATORY_OPTIONS))
      @information[:filename]
    end

    def information
      @information ||= run_with_options(options.merge(INFORMATION_OPTIONS))
    end

    private

    def run_with_options(options)
      JSON.parse(run(options), symbolize_names: true)
    end

    def run(options)
      Runner.new(
        executable_path: YtDlp.config.executable_path,
        url: url,
        options: options
      ).run
    end
  end
end
