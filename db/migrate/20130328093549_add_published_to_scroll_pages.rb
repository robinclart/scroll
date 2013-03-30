class AddPublishedToScrollPages < ActiveRecord::Migration
  def change
    add_column :scroll_pages, :published, :boolean
  end
end
