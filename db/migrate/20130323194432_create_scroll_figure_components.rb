class CreateScrollFigureComponents < ActiveRecord::Migration
  def change
    create_table :scroll_figure_components do |t|
      t.text :caption
      t.text :url
      t.string :style

      t.timestamps
    end
  end
end
