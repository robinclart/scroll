class CreateScrollComponents < ActiveRecord::Migration
  def change
    create_table :scroll_components do |t|
      t.references :column
      t.references :renderable, polymorphic: true
      t.integer :position

      t.timestamps
    end
    add_index :scroll_components, :column_id
  end
end
