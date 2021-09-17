# frozen_string_literal: true

require 'spec_helper'

describe YtDlp::RunnerOptions do
  subject(:runner_option) { described_class.new(options) }

  describe '#to_command_options' do
    subject(:to_command_options) { runner_option.to_command_options }

    context 'with an empty hash' do
      let(:options) { {} }

      it { is_expected.to be_empty }
    end

    context 'with a key: value pair' do
      let(:options) { { key: 'value' } }

      it { is_expected.to eq '--key value' }
    end

    context 'with a boolean value equals to true' do
      let(:options) { { key: true } }

      it { is_expected.to eq '--key' }
    end

    context 'with a boolean value equals to false' do
      let(:options) { { key: false } }

      it { is_expected.to eq '--no-key' }
    end

    context 'when the key contains an underscore' do
      let(:options) { { my_option: 'value' } }

      it 'is replaced by an hypen' do
        expect(to_command_options).to eq '--my-option value'
      end
    end

    context 'when mixing multiple options' do
      let(:options) do
        {
          colors: true,
          output: 'output.mp4',
          progress: false
        }
      end

      it 'concatenates all options properly' do
        expect(to_command_options).to eq '--colors --output output.mp4 --no-progress'
      end
    end
  end
end
