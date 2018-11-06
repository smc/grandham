# frozen_string_literal: true

require "spec_helper"

describe Search do
  let(:search) { described_class.new("author: test; title: test;") }
end
