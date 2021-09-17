# frozen_string_literal: true

require 'spec_helper'

# rubocop:disable RSpec/MultipleMemoizedHelpers
describe YtDlp::Runner do
  subject(:runner) do
    described_class.new(
      executable_path: Pathname(executable_path),
      url: url,
      options: options
    )
  end

  let(:executable_path) { 'yt-dlp' }
  let(:url) { 'http://www.example.com' }
  let(:options) { { opt: true } }
  let(:to_command_options) { '--opt' }
  let(:logger) { Logger.new($stdout) }

  before do
    YtDlp.configure do |config|
      config.logger = logger
    end
  end

  describe '#run' do
    subject(:run) { runner.run }

    let(:command_line) { instance_double(Terrapin::CommandLine, run: run_output) }
    let(:run_output) { 'execution output' }

    before do
      allow(Terrapin::CommandLine).to receive(:new).with(
        executable_path, "\"#{url}\" #{to_command_options}", logger: logger
      ).and_return(command_line)
    end

    it 'returns the output of the execution' do
      expect(run).to eq run_output
    end
  end
end
# rubocop:enable RSpec/MultipleMemoizedHelpers
