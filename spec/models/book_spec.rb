require 'spec_helper'

describe Book do

  it{ should validate_presence_of(:title) }
  it{ should validate_presence_of(:isbn) }

  it{ should validate_numericality_of(:year) }
  it{ should validate_numericality_of(:pages) }

  it{ should belong_to(:language) }

  it{ should have_many(:authors) }
  it{ should have_many(:authorships) }
  it{ should have_many(:publications) }
  it{ should have_many(:publishers) }
  it{ should have_many(:availabilities) }
  it{ should have_many(:libraries) }
  it{ should have_many(:edits) }
  it{ should have_many(:new_items) }
  it{ should have_many(:covers) }

end
