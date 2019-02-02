# frozen_string_literal: true

class MalayalamTextNormalizer
  ATOMIC_CHILLU_MAP = {
    "ന്‍" => "ൻ",
    "ണ്‍" => "ൺ",
    "ര്‍" => "ർ",
    "ല്‍" => "ൽ",
    "ള്‍" => "ൾ",
    "ക്‍" => "ൿ"
  }.freeze
  def initialize(text)
    @text = text
  end

  def call
    return text if text.blank?

    ATOMIC_CHILLU_MAP.each do |non_atomic, atomic|
      @text = text.gsub(atomic, non_atomic)
    end
    text
  end

  private

  attr_reader :text
end
