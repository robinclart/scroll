require_dependency "scroll/application_controller"

module Scroll
  class PagesController < ApplicationController
    skip_before_filter :authentication_required, only: [:show]

    def show
      page = Page.find_by_path(request.path)

      if page || can_edit_scroll?
        render locals: { page: page }
      else
        render file: Rails.root.join("public", "404.html"), layout: false
      end
    end

    def create
      page = Page.create(path: params[:path].to_s)
      redirect_to page.path
    end

    def update
      page.update_attributes(page_params)
      redirect_to page.path
    end

    def destroy
      page.destroy
      redirect_to page.path
    end

    private

    def page
      @page ||= Page.find(params[:id])
    end

    def page_params
      params.require(:page).permit(:title, :path, :meta_description, :meta_keywords)
    end
  end
end
