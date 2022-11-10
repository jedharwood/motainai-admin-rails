# frozen_string_literal: true

class CreateRuleDays < ActiveRecord::Migration[7.0]
  def change
    create_table :rule_days do |t|
      t.references :city, null: false, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
