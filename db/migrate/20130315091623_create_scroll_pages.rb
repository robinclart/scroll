class CreateScrollPages < ActiveRecord::Migration
  def change
    create_table :scroll_pages do |t|
      t.string :path
      t.string :redirect_path
      t.string :title
      t.text :meta_keywords
      t.text :meta_description

      t.timestamps
    end
  end
end
