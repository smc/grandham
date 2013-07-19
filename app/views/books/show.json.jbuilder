json.(@book, :grandham_id)
json.language @book.language.short_code
json.(@book.approved_submission, :title, :isbn, :pages, :year, :description, :edition)