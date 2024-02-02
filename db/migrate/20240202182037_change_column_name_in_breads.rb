class ChangeColumnNameInBreads < ActiveRecord::Migration[7.0]
  def change
    rename_column :breads, :countries_id, :country_id
  end
end
