class UpdateInstructionsInBreads < ActiveRecord::Migration[7.0]
  def up
    execute <<-SQL
      ALTER TABLE breads ALTER COLUMN instructions TYPE text[] USING ARRAY[instructions];
    SQL
  end

  def down
    execute <<-SQL
      ALTER TABLE breads ALTER COLUMN instructions TYPE text USING instructions::text;
    SQL
  end
end
