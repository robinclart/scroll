class CreateScrollRows < ActiveRecord::Migration
  def change
    create_table :scroll_rows do |t|
      t.references :page
      t.integer :position

      t.timestamps
    end
    add_index :scroll_rows, :page_id
  end
end
