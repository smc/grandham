# frozen_string_literal: true

require "spec_helper"

describe Book do
  it { is_expected.to validate_presence_of(:title) }
  it { is_expected.to validate_presence_of(:isbn) }

  it { is_expected.to validate_numericality_of(:year) }
  it { is_expected.to validate_numericality_of(:pages) }

  it { is_expected.to belong_to(:language) }

  it { is_expected.to have_many(:authors) }
  it { is_expected.to have_many(:authorships) }
  it { is_expected.to have_many(:publications) }
  it { is_expected.to have_many(:publishers) }
  it { is_expected.to have_many(:availabilities) }
  it { is_expected.to have_many(:libraries) }
  it { is_expected.to have_many(:edits) }
  it { is_expected.to have_many(:new_items) }
  it { is_expected.to have_many(:covers) }
end
