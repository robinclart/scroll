class CreateScrollTextComponents < ActiveRecord::Migration
  def change
    create_table :scroll_text_components do |t|
      t.text :content
      t.string :style

      t.timestamps
    end
  end
end
