require 'spec_helper'

describe BooksController do
  before(:each) do
    @book = FactoryGirl.create :book
  end

  describe "GET index" do
    context "current_language" do
      it "should set current language" do
        get :index, language_id: @book.language.short_code
        expect(controller.send :current_language).not_to be_nil
      end
    end

    context "current_book" do
      it "should set current book" do
        get :index, book_id: @book.grandham_id
        expect(controller.send :current_book).not_to be_nil
      end
    end

    it "assigns all books as @books" do
      get :index
      assigns(:books).should be_a ActiveRecord::Relation
      assigns(:books).should include(@book)
    end

    it "should return http success on json request" do
      get :index, format: :json
      response.should be_success
    end

    describe "influence of language parameter" do
      before(:each) do
        5.times do
          book = FactoryGirl.create :book
          book.submissions << FactoryGirl.create(:submission, approved: true)
        end
      end

      context "No language parameter is given" do
        it "should assign @books with all books which have approved submission" do
          get :index
          expect(assigns(:books)).to eq Book.has_approved_submission
        end
      end

      context "Language parameter is given" do
        it "should assign @books with all books of specific language which have approved submission" do
          FactoryGirl.create :book, language_id: @book.language.id
          book_2 = FactoryGirl.create :book, language_id: FactoryGirl.create(:language, short_code: 'HI').id

          get :index, language_id: book_2.language
          expect(assigns(:books).sort).to eq book_2.language.books.sort
        end
      end
    end
  end

  describe "GET show" do
    it "should return http success on json request" do
      get :show, id: @book, format: :json
      response.should be_success
    end

    it "should assign book as @book" do
      get :show, id: @book
      assigns(:book).should eq @book
    end
  end

  describe "GET show" do
    it "should find and assign @book" do
      get :show, id: @book, language_id: @book.language
      expect(assigns[:book]).to eq @book
    end
  end
end