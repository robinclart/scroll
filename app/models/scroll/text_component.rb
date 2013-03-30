module Scroll
  class TextComponent < Model
    include Scroll::Renderable

    def presentable?
      content.present?
    end
  end
end
