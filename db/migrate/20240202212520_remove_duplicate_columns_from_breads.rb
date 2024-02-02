class RemoveDuplicateColumnsFromBreads < ActiveRecord::Migration[7.0]
  def change
    remove_column :breads, :country_id
  end
end
