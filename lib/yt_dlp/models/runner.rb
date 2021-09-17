# frozen_string_literal: true

module YtDlp
  #
  # Wraps the execution of the yt-dlp command.
  # Assumes
  #
  class Runner < ModelBase
    # Executable to run.
    #
    # @!attribute [r] executable_path
    #   @return [Types.Instance(PathName)]
    attribute :executable_path, Types.Instance(Pathname)
    # Download URL.
    #
    # @!attribute [r] url
    #   @return [Types::String]
    attribute :url, Types::String
    # Option passed to the executable.
    #
    #
    # @!attribute [r] options
    #   @return [Types.Instance(RunnerOptions)]
    attribute? :options, Types::Hash.optional.default({}.freeze)

    #
    # Run the executable with the specified options.
    #
    # @return [String] execution output
    #
    def run
      command_line.run
    end

    private

    def command_line
      @command_line ||= build_command_line
    end

    def build_command_line
      Terrapin::CommandLine.new(
        executable_path.to_s,
        "#{quoted_url} #{command_options}",
        logger: YtDlp.logger
      )
    end

    def quoted_url
      Utils.quoted(url)
    end

    def command_options
      runner_options.to_command_options
    end

    def runner_options
      @runner_options ||= RunnerOptions.new(options)
    end
  end
end
