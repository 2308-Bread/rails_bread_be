class RemoveDescriptionFromCountries < ActiveRecord::Migration[7.0]
  def change
    remove_column :countries, :description, :string
  end
end
