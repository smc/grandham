namespace :grandham do
  desc "Import information from old Malayalagrandham database (from exported json file). Set the file path in 'FROM' environment variable"
  task :import => :environment do
    language = Language.find_by_short_code('ML')
    books = JSON.load(open(File.join(ENV['FROM'])).read)
    import_progress_bar = ProgressBar.create(:format => '%a |%b>%i| %p%% %t', :total => books.count)

    import_params = [ 'title', 'pages', 'year' 'edition' ]

    books.each do |book|
      import_progress_bar.increment

      book_obj = language.books.create
      submission = book_obj.submissions.new

      import_params.each do |key|
        submission[key] = book[key.capitalize] unless book[key.capitalize] == 'None'
      end
      submission.save
      submission.update_attribute(:approved, true)

      submission.authors << language.authors.where(name: book['Author']).first_or_create!
      submission.publishers << language.publishers.where(name: book['publisher']).first_or_create!
    end
  end
end