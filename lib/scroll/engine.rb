module Scroll
  class Engine < ::Rails::Engine
    isolate_namespace Scroll

    config.to_prepare do
      Scroll::Component.register_type "scroll/title_component"
      Scroll::Component.register_type "scroll/figure_component"
      Scroll::Component.register_type "scroll/text_component"
    end
  end
end
