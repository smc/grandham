module SubmissionsHelper

  def submission_url
    current_language ? language_submissions_path(current_language) : book_submissions_path(current_book)
  end
end
