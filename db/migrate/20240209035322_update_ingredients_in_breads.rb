class UpdateIngredientsInBreads < ActiveRecord::Migration[7.0]
  def up
    execute <<-SQL
      ALTER TABLE breads ALTER COLUMN ingredients TYPE text[] USING ARRAY[ingredients];
    SQL
  end

  def down
    execute <<-SQL
      ALTER TABLE breads ALTER COLUMN ingredients TYPE text USING ingredients::text;
    SQL
  end
end
