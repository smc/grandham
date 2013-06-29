class SubmissionsController < ApplicationController

  def index
    @submissions = Submission.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @submissions }
    end
  end

  def show
    @submission = Submission.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @submission }
    end
  end

  def new
    @submission = Submission.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @submission }
    end
  end

  def edit
    @submission = Submission.find(params[:id])
  end

  def create
    if params[:book_id]
      book = Book.find_by_grandham_id(params[:book_id])
      redirect_path = book_path(book)
    else
      book = current_language.books.create
      redirect_path = root_url
    end

    @submission = book.submissions.new(params[:submission])

    respond_to do |format|
      if @submission.save
        format.html { redirect_to redirect_path, notice: 'Your submission has been posted and has gone for moderation' }
        format.json { render json: @submission, status: :created }
      else
        format.html { render action: "new" }
        format.json { render json: @submission.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @submission = Submission.find(params[:id])

    respond_to do |format|
      if @submission.update_attributes(params[:submission])
        format.html { redirect_to @submission, notice: 'Submission was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @submission.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @submission = Submission.find(params[:id])
    @submission.destroy

    respond_to do |format|
      format.html { redirect_to submissions_url }
      format.json { head :no_content }
    end
  end
end
