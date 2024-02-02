class CreateUserBreads < ActiveRecord::Migration[7.0]
  def change
    create_table :user_breads do |t|
      t.references :user, null: false, foreign_key: true
      t.references :bread, null: false, foreign_key: true

      t.timestamps
    end
  end
end
