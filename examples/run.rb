# frozen_string_literal: true

$LOAD_PATH.unshift(File.join(__dir__, '..', 'lib'))

#########
require 'yt_dlp'

YtDlp.configure do |config|
  # config.executable_path = 'path/to/yt-dlp'
  config.logger = Logger.new($stderr)
end

url = 'https://www.youtube.com/watch?v=fzlT80jQ3lo'

# allow directly output: 'test.mp4'
video = YtDlp::Video.new url, output: 'test.mp4'

# puts video.download
video.information

#########
