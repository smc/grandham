namespace :grandham do
  desc "Import information from old Malayalagrandham database (from exported json file). Set the file path in 'FROM' environment variable"
  task :import => :environment do
    language = Language.find_by_short_code('ML')
    books = JSON.load(open(File.join(ENV['FROM'])).read)
    import_progress_bar = ProgressBar.create(:format => '%a |%b>%i| %p%% %t', :total => books.count)

    import_map = {
      'Title'       => 'title',
      'Pages'       => 'pages',
      'Year'        => 'year',
      'Edition'     => 'edition',
      'Titleorg'    => 'title_orginal',
      'Vol'         => 'volume',
      'Series'      => 'series',
      'Preface'     => 'preface',
      'Length'      => 'length',
      'Price'       => 'price',
      'Note'        => 'Note',
      'DDC'         => 'ddc',
      'Illustrator' => 'illustrator'
    }

    books.each do |book|
      import_progress_bar.increment

      book_obj = language.books.new

      import_map.each do |old_key, new_key|
        book_obj[new_key] = book[old_key] unless book[old_key] == 'None'
      end

      book_obj.save && book_obj.approve!

      book_obj.new_items.create user_id: User.first.id, language_id: Language.first.id, state: 'approved'

      author_info = book['Author']
      if author_info.include?('[')
        book_obj.authors << language.authors.where(name: book['Author']).first_or_create!
      else
        author_info.split(';').each do |author|
          book_obj.authors << language.authors.where(name: author).first_or_create!
        end
      end

      book['Location'].split(';').each do |library|
        library_name, library_place = library.split(',')
        book_obj.libraries << language.libraries.where(name: library_name, place: library_place).first_or_create!
      end

      publisher_name, publisher_place = book['publisher'].split(',')
      book_obj.publishers << language.publishers.where(name: publisher_name, place: publisher_place).first_or_create!
    end
  end
end