# frozen_string_literal: true

module YtDlp
  class Configuration
    attr_writer :logger, :executable_path

    def logger
      @logger ||= Logger.new($stdout)
    end

    def executable_path
      @executable_path ||= File.join(__dir__, '../../vendor/bin/yt-dlp')
    end
  end

  class << self
    def configure
      yield config
    end

    def config
      @config ||= Configuration.new
    end
  end
end
