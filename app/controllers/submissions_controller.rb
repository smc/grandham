class SubmissionsController < ApplicationController

  def index
    @submissions = Submission.all

    respond_to do |format|
      format.html
      format.json { render json: @submissions }
    end
  end

  def show
    @submission = Submission.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render json: @submission }
    end
  end

  def new
    if current_book
      @submission = Submission.initialize_with_data(current_book)
    else
      @submission = Submission.new
      @submission.authors.build
      @submission.publishers.build
    end

    respond_to do |format|
      format.html
      format.json { render json: @submission }
    end
  end

  def edit
    @submission = Submission.find(params[:id])
  end

  def create
    if book = current_book
      new_book = false
      redirect_path = book_path(book)
    else
      book = current_language.books.create
      new_book = true
      redirect_path = root_url
    end

    @submission = book.submissions.new(params[:submission])

    respond_to do |format|
      if @submission.save
        format.html { redirect_to redirect_path, notice: 'Your submission has been posted and has gone for moderation' }
        format.json { render json: @submission, status: :created }
      else
        book.destroy if new_book
        format.html { render action: "new" }
        format.json { render json: @submission.errors, status: :unprocessable_entity }
      end
    end
  end
end