class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
    t.string   :grandham_id
    t.integer  :language_id
    t.text     :title
    t.string   :isbn
    t.string   :pages
    t.string   :year
    t.text     :description
    t.string   :edition
    t.string   :ddc
    t.string   :volume
    t.string   :series
    t.string   :price
    t.string   :length
    t.text     :title_orginal
    t.text     :illustrator
    t.text     :note
    t.text     :preface

    t.timestamps
    end
  end
end
