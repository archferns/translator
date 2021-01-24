# frozen_string_literal: true

class CreateTexts < ActiveRecord::Migration[6.1]
  def change
    create_table :texts, id: :uuid do |t|
      t.references :project, type: :uuid, null: false, foreign_key: true
      t.string :key
      t.timestamps
    end
  end
end
