# frozen_string_literal: true

require 'spec_helper'

describe BooksController do
  before do
    @book = FactoryGirl.create :book
  end

  describe 'GET index' do
    context 'current_language' do
      it 'sets current language' do
        get :index, params: { language_id: @book.language.short_code }
        expect(controller.send(:current_language)).not_to be_nil
      end
    end

    context 'current_book' do
      it 'sets current book' do
        get :show, params: { id: @book.grandham_id }
        expect(controller.send(:current_book)).not_to be_nil
      end
    end

    it 'assigns all books as @books' do
      get :index
      expect(assigns(:books)).to be_a ActiveRecord::Relation
      expect(assigns(:books)).to include(@book)
    end

    it 'returns http success on json request' do
      get :index
      expect(response).to be_success
    end

    describe 'influence of language parameter' do
      before do
        5.times do
          book = FactoryGirl.create :book
        end
      end
    end
  end

  describe 'GET show' do
    it 'returns http success on json request' do
      get :show, params: { id: @book }
      expect(response).to be_success
    end

    it 'assigns book as @book' do
      get :show, params: { id: @book }
      expect(assigns(:book)).to eq @book
    end
  end

  describe 'GET show' do
    it 'finds and assign @book' do
      get :show, params: { id: @book, language_id: @book.language }
      expect(assigns[:book]).to eq @book
    end
  end
end
