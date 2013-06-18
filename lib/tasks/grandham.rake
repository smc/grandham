namespace :grandham do
  desc "Import information from old Malayalagrandham database (from exported json file). Set the file path in 'FROM' environment variable"
  task :import => :environment do
    language = Language.find_by_short_code('ML')
    books = JSON.load(open(File.join(ENV['FROM'])).read)
    import_progress_bar = ProgressBar.create(:format => '%a |%b>%i| %p%% %t', :total => books.count)

    import_data_map = {
      'DDC'         => 'DDC',
      'Title'       => 'Title (sub-title included)',
      'Author'      => 'Author 1, Personal, Main',
      'Titleorg'    => 'Title Org',
      'Vol'         => 'Volume/Part',
      'Edition'     => 'Edition',
      'Series'      => 'Series',
      'Year'        => 'Year',
      'publisher'   => 'Publisher',
      'Preface'     => 'Preface',
      'Illustrator' => 'Illustrator',
      'Pages'       => 'Pages',
      'Length'      => 'Length',
      'Price'       => 'Price',
      'Note'        => 'Note/Abstract',
      'Location'    => 'Location'
    }

    books.each do |book|
      import_progress_bar.increment

      book_obj = language.books.create
      submission = book_obj.submissions.create approved: true
      (book.keys - ['id', 'Language']).each do |key|
        unless book[key] == 'None'
          submission.data.create value: book[key], field_id: Field.find_by_name(import_data_map[key]).id
        end
      end
    end
  end
end
