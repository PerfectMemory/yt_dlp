# frozen_string_literal: true

module YtDlp
  #
  # Data model for a video accessed from an URL.
  #
  class Video
    attr_reader :url, :executable_path, :options

    # Required to get informations about the video.
    MANDATORY_OPTIONS = {
      dump_json: true,
      simulate: false
    }.freeze

    # Optimisation purpose. Do not download the video if you only need information.
    INFORMATION_OPTIONS = MANDATORY_OPTIONS.merge(skip_download: true).freeze

    #
    # Initialize a Video.
    #
    #
    # @param [String] url Download URL
    # @param [Hash] **options See OptionConverter and https://github.com/yt-dlp/yt-dlp
    #
    def initialize(url, executable_path = YtDlp.config.executable_path, **options)
      @url = url
      @executable_path = executable_path
      @options = options
    end

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
      Runner.new(executable_path: executable_path, url: url, options: options).run
    end
  end
end
