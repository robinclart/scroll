module Scroll
  class TitleComponent < Model
    include Scroll::Renderable

    def presentable?
      content.present?
    end
  end
end
