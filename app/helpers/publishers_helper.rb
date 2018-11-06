# frozen_string_literal: true

module PublishersHelper
  def publisher_logo(publisher)
    if publisher.logos.empty?
      "/book_cover_missing.png"
    else
      publisher.logos.last.image.url(:thumb)
    end
  end
end
