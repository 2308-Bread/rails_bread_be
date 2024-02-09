class AddColumnsToCountries < ActiveRecord::Migration[7.0]
  def change
    add_column :countries, :overview, :string
    add_column :countries, :culinary, :string
    add_column :countries, :imageUrl, :string
  end
end
