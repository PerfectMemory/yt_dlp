# frozen_string_literal: true

$LOAD_PATH.unshift(File.join(__dir__, '..', 'lib'))

#########
require 'yt_dlp'

YtDlp.configure do |config|
  config.logger = Logger.new($stderr)
end

options = { output: 'test.mp4' }
url = 'https://www.youtube.com/watch?v=fzlT80jQ3lo'

video = YtDlp::Video.new(url: url, options: options)

puts video.download
video.information

#########
