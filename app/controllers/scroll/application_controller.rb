module Scroll
  class ApplicationController < ActionController::Base
    layout Scroll.config.engine_layout

    Scroll.config.helpers.each do |h|
      helper h.constantize
      include h.constantize
    end

    before_filter :authentication_required

    private

    def authentication_required
      render text: "Authentication Required" if !can_edit_scroll?
    end
  end
end
