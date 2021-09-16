# frozen_string_literal: true

require 'spec_helper'

describe YtDlp do
  it 'has a version number' do
    expect(described_class::VERSION).not_to be nil
  end

  describe 'configuration' do
    subject(:configuration) { described_class.config }

    before { described_class.reset_config }

    its(:logger) { is_expected.to be_an_instance_of(Logger) }

    its(:executable_path) { is_expected.to be_an_instance_of(Pathname) }
  end
end
