# frozen_string_literal: true

class AddDayCodeColumnToRuleDays < ActiveRecord::Migration[7.0]
  def change
    add_column :rule_days, :code, :integer
  end
end
