# frozen_string_literal: true

require 'dry/configurable'
require 'pathname'
require 'yt_dlp/version'

#
# Top level module for YtDlp.
#
module YtDlp
end

require_relative 'yt_dlp/configuration'
require_relative 'yt_dlp/utils'
require_relative 'yt_dlp/runner_options'
