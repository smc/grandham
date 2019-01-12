# frozen_string_literal: true

class BookSerializer
  include FastJsonapi::ObjectSerializer
  attributes :grandham_id, :title, :isbn, :pages, :year, :description, :edition, :ddc, :volume,
             :series, :price, :length, :title_orginal, :illustrator, :note, :preface

  has_many :authors
  has_many :libraries
end
