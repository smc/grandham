class Admin::ReviewsController < AdminController
  def index
    @edits = current_language.edits
  end
end