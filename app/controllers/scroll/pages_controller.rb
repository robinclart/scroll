require_dependency "scroll/application_controller"

module Scroll
  class PagesController < ApplicationController
    skip_before_filter :authentication_required, only: [:show]

    def index
      pages = Page.order(:path).all.sort { |pa,pb| "#{pa.path}/" <=> "#{pb.path}/" }

      render locals: { pages: pages }
    end

    def show
      pages = Page.where(path: request.path)

      if can_edit_scroll?
        render locals: { page: pages.first }
      else
        if page = pages.where(published: true).first
          render locals: { page: page }
        else
          render file: Rails.root.join("public", "404.html"), layout: false
        end
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
      params.require(:page).permit(:title, :published, :path, :meta_description, :meta_keywords)
    end
  end
end
