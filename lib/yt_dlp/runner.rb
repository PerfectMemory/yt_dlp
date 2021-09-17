# frozen_string_literal: true

module YtDlp
  #
  # Wraps the execution of the yt-dlp command.
  #
  class Runner
    attr_reader :executable_path, :url, :options

    #
    # Initialize the runner.
    #
    # @param [String] executable_path Executable to run
    # @param [<Type>] url Download URL
    # @param [options] options Command options
    #
    def initialize(executable_path:, url:, options: {})
      @executable_path = executable_path
      @url = url
      @options = options
    end

    #
    # Run the executable with the specified options.
    #
    # @return [String] execution output
    #
    def run
      command_line.run
    rescue Terrapin::CommandLineError
      raise Errors::YtDlpError
    end

    private

    def command_line
      @command_line ||= build_command_line
    end

    def build_command_line
      Terrapin::CommandLine.new(
        executable_path.to_s,
        "#{quoted_url} #{command_options}",
        logger: YtDlp.config.logger
      )
    end

    def quoted_url
      "\"#{url}\""
    end

    def command_options
      runner_options.to_command_options
    end

    def runner_options
      @runner_options ||= OptionsConverter.new(options)
    end
  end
end
