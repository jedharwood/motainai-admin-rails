class CreateWasteTypes < ActiveRecord::Migration[7.0]
  def change
    create_table :waste_types do |t|
      t.string :name
      t.text :description
      t.text :instructions
      t.text :irregular_frequency

      t.timestamps
    end
  end
end
