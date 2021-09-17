# frozen_string_literal: true

module YtDlp
  # Link to the documentation for those who are new to dry-configurable
  # https://dry-rb.org/gems/dry-configurable/
  extend Dry::Configurable

  # Info logger (useful to print the executed command)
  setting :logger, default: Logger.new($stdout), reader: true

  # Path to the yt-dlp executable
  setting :executable_path,
          constructor: ->(path) { Pathname(path) },
          default: File.join(__dir__, '..', '..', 'vendor', 'bin', 'yt-dlp'),
          reader: true
end
