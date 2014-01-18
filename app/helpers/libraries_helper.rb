module LibrariesHelper
  def library_logo(library)
    if library.logos.empty?
      '/book_cover_missing.png'
    else
      library.logos.last.image.url(:thumb)
    end
  end
end
