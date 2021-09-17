# frozen_string_literal: true

require 'spec_helper'

describe YtDlp::Runner do
  subject(:runner) do
    described_class.new(
      executable_path: 'yt-dlp',
      url: 'http://www.example.com',
      options: { opt: true }
    )
  end

  describe '#run' do
    subject(:run) { runner.run }

    let(:command_line) { instance_double(Terrapin::CommandLine, run: 'execution output') }

    before do
      allow(Terrapin::CommandLine).to receive(:new).with(
        'yt-dlp', '"http://www.example.com" --opt', anything
      ).and_return(command_line)
    end

    it 'returns the output of the execution' do
      expect(run).to eq 'execution output'
    end
  end
end
