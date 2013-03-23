class AddAttachmentImageToScrollFigureComponents < ActiveRecord::Migration
  def up
    add_attachment :scroll_figure_components, :image
  end

  def down
    remove_attachment :scroll_figure_components, :image
  end
end
