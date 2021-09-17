# frozen_string_literal: true

require 'json'
require 'logger'
require 'terrapin'
require 'yt_dlp/version'

#
# Top level module for YtDlp.
#
module YtDlp
  module Errors
    class YtDlpError < StandardError
    end
  end
end

require_relative 'yt_dlp/configuration'
require_relative 'yt_dlp/options_converter'
require_relative 'yt_dlp/runner'
require_relative 'yt_dlp/video'
