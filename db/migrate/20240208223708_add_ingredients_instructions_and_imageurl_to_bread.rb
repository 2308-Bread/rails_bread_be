class AddIngredientsInstructionsAndImageurlToBread < ActiveRecord::Migration[7.0]
  def change
    remove_column :breads, :recipe

    add_column :breads, :ingredients, :string
    add_column :breads, :instructions, :string
    add_column :breads, :imageUrl, :string
  end
end
