# frozen_string_literal: true

class AddCityIdColumnToWasteType < ActiveRecord::Migration[7.0]
  def change
    add_column :waste_types, :city_id, :integer
  end
end
