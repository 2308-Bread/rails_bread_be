class CreateBreads < ActiveRecord::Migration[7.0]
  def change
    create_table :breads do |t|
      t.string :name
      t.string :description
      t.string :recipe
      t.references :country, null: false, foreign_key: true

      t.timestamps
    end
  end
end
