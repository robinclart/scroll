class CreateScrollTitleComponents < ActiveRecord::Migration
  def change
    create_table :scroll_title_components do |t|
      t.text :content
      t.string :style
      t.text :url

      t.timestamps
    end
  end
end
