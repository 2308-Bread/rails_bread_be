class AddColumnToBreads < ActiveRecord::Migration[7.0]
  def change
    add_reference :breads, :country, null: false, foreign_key: true
  end
end
