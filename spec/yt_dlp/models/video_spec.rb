# frozen_string_literal: true

require 'spec_helper'

describe YtDlp::Video do
  subject(:video) { described_class.new(url: url, options: options) }

  let(:url) { 'http://www.example.com' }
  let(:options) { { opt: true } }

  let(:runner) { instance_double(YtDlp::Runner, run: runner_output) }
  let(:runner_output) { read_fixture('sample.json') }

  before do
    allow(YtDlp::Runner).to receive(:new).and_return(runner)
  end

  describe '#download' do
    subject(:download) { video.download }

    it { is_expected.to be_an_instance_of(String) }

    it 'returns the filename of the downloaded video' do
      expect(download).to eq 'test.mp4'
    end
  end

  describe '#information' do
    subject(:information) { video.information }

    it 'still return information about the video' do
      expect(information).to eq JSON.parse(runner_output, symbolize_names: true)
    end
  end
end
