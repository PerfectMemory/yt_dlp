# frozen_string_literal: true

module Helpers
  def fixture_path(*path)
    File.join(__dir__, '..', 'etc', path)
  end

  def read_fixture(*path)
    File.read(fixture_path(*path))
  end

  def load_json(*path, symbolize_names: true)
    JSON.parse(File.read(fixture_path(*path)), symbolize_names: symbolize_names)
  end
end
