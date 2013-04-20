require_dependency "redcarpet"

module Scroll
  module ScrollHelper
    def render_scroll(path = nil)
      render template: "scroll/pages/show", locals: { page: find_scroll(path) }
    end

    def find_scroll(path)
      path = request.path if path.nil? && respond_to?(:request)
      Scroll::Page.find_by_path(path)
    end

    def component_form_for(renderable, options = {}, &block)
      options.merge!(url: scroll.component_path(renderable.component), as: :component, remote: true, html: { class: "Form" })
      form_for renderable, options, &block
    end

    def markdown(source)
      redcarpet_markdown(source)
    end

    def redcarpet_markdown(source)
      @markdown ||= Redcarpet::Markdown.new(redcarpet_html_renderer, {
        no_intra_emphasis: true,
        tables: true,
        fenced_code_blocks: true,
        autolink: true,
        strikethrough: false,
        lax_html_blocks: false,
        space_after_headers: true,
        superscript: true
      })
      @markdown.render(source).html_safe
    end

    private

    def redcarpet_html_renderer
      @renderer ||= Redcarpet::Render::HTML.new({
        filter_html: false,
        no_images: false,
        no_links: false,
        no_styles: true,
        safe_links_only: false,
        with_toc_data: true,
        hard_wrap: false,
        xhtml: false
      })
    end
  end
end
