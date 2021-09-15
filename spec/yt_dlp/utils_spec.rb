# frozen_string_literal: true

require 'spec_helper'

describe YtDlp::Utils do
  describe '.quoted' do
    subject(:quoted) { described_class.quoted(input) }

    let(:input) { 'sample' }

    it 'adds quotes around the input' do
      expect(quoted).to eq '"sample"'
    end
  end
end
