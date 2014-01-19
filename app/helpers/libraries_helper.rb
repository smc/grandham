module LibrariesHelper
  def library_logo(library)
    if library.logos.empty?
      '/library_logo_missing.png'
    else
      library.logos.last.image.url(:thumb)
    end
  end
end
