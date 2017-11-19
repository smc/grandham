# frozen_string_literal: true

module AuthorsHelper
  def author_profile_picture(author)
    if author.profile_pictures.empty?
      '/author_profile_picture_missing.png'
    else
      author.profile_pictures.last.image.url(:thumb)
    end
  end
end
