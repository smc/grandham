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

      book_obj = language.books.create
      submission = book_obj.submissions.new

      import_map.each do |old_key, new_key|
        submission[new_key] = book[old_key] unless book[old_key] == 'None'
      end
      submission.approved = submission.reviewed = true
      submission.save

      submission.authors << language.authors.where(name: book['Author']).first_or_create!
      submission.publishers << language.publishers.where(name: book['publisher']).first_or_create!
    end
  end
end