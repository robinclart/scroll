require_dependency "scroll/application_controller"

module Scroll
  class RowsController < ApplicationController
    def new
      render layout: false
    end

    def create
      row = Row.create_from_format(row_format, row_params)
      redirect_to row.page.path
    end

    def destroy
      page = row.page
      row.destroy
      redirect_to page.path
    end

    private

    def page
      @page ||= Page.find(params[:page_id])
    end

    def row
      @row ||= Row.find(params[:id])
    end

    def row_format
      Scroll::Column.normalize_format(params[:columns])
    end

    def row_params
      { position: params[:position], page_id: params[:page_id] }
    end
  end
end
