module Scroll
  class FigureComponent < Model
    include Scroll::Renderable

    ATTACHMENT_STYLES = { large: "1880x1880>", thumb: "100x100>" }

    has_attached_file :image, PAPERCLIP_OPTIONS.merge({
      styles: ATTACHMENT_STYLES
    })

    def presentable?
      image.present?
    end
  end
end
