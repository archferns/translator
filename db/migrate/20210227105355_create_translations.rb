# frozen_string_literal: true

class CreateTranslations < ActiveRecord::Migration[6.1]
  def change
    create_table :translations, id: :uuid do |t|
      t.references :text, type: :uuid, null: false, foreign_key: true
      t.string :locale, null: false
      t.text :value

      t.timestamps
    end
  end
end
