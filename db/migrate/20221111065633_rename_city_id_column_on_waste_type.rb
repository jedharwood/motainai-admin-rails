class RenameCityIdColumnOnWasteType < ActiveRecord::Migration[7.0]
  def change
    rename_column :waste_types, :city_id, :city_identifier
  end
end
