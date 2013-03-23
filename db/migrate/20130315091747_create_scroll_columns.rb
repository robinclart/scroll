class CreateScrollColumns < ActiveRecord::Migration
  def change
    create_table :scroll_columns do |t|
      t.integer :position
      t.integer :size
      t.references :row

      t.timestamps
    end
    add_index :scroll_columns, :row_id
  end
end
