class AddRuleDayToWasteType < ActiveRecord::Migration[7.0]
  def change
    add_reference :waste_types, :rule_day, null: false, foreign_key: true
  end
end
