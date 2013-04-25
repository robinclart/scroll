class AddWidthToFigureComponents < ActiveRecord::Migration
  def change
    add_column :scroll_figure_components, :width, :integer
  end
end
