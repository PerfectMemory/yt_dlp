# yt_dlp

Wrapper for the [yt_dlp](https://github.com/yt-dlp/yt-dlp) tool.
This gem is heavily inspired by the [youtube_dl.rb](https://github.com/layer8x/youtube-dl.rb) gem.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'yt_dlp'
```

And then execute:

```bash
bundle
```

Or install it yourself as:

```bash
gem install yt_dlp
```

## Usage

### Configuration

One can configure:

- 'executable_path': the path where yt-dlp is located. Default : vendor/bin/yt-dlp

- 'logger': the logger used to print various parts of the execution.

Those variable can be configured using the following code:

```ruby
YtDlp.configure do |config|
  config.executable_path = <YOUR_PATH>
  config.logger = <YOUR_LOGGER>
end
```

### Download a video

```ruby
require 'yt_dlp'

YtDlp.configure do |config|
  # config.executable_path = 'path/to/yt-dlp'
  config.logger = Logger.new($stderr)
end

url = 'https://www.youtube.com/watch?v=fzlT80jQ3lo'

# See https://github.com/yt-dlp/yt-dlp for the list of options
video = YtDlp::Video.new url, output: 'test.mp4'

output_file = video.download
# Do something with output file
```

### Get information about a video

```ruby
require 'yt_dlp'

YtDlp.configure do |config|
  # config.executable_path = 'path/to/yt-dlp'
  config.logger = Logger.new($stderr)
end

url = 'https://www.youtube.com/watch?v=fzlT80jQ3lo'

# See https://github.com/yt-dlp/yt-dlp for the list of options
video = YtDlp::Video.new url

information = video.information
# Do something with information
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/PerfectMemory/yt_dlp. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## Code of Conduct

Everyone interacting in the AzureStt project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/PerfectMemory/yt_dlp/blob/main/CODE_OF_CONDUCT.md).