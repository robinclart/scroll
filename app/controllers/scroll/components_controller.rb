require_dependency "scroll/application_controller"

module Scroll
  class ComponentsController < ApplicationController
    def new
      render layout: false
    end

    def show
      render locals: { renderable: component.renderable }, layout: !request.xhr?
    end

    def edit
      template_directory = component.renderable.class.name.tableize
      render "#{template_directory}/edit", locals: { renderable: component.renderable }, layout: !request.xhr?
    end

    def create
      component = Component.create_from_type(row_type, component_params)
      redirect_to component.column.row.page.path
    end

    def update
      component.renderable.update_attributes(component_renderable_params)
      if request.xhr?
        render nothing: true
      else
        redirect_to component.column.row.page.path
      end
    end

    def destroy
      path = component.column.row.page.path
      component.destroy
      redirect_to path
    end

    private

    def component
      @component ||= Component.find(params[:id])
    end

    def row_type
      params[:type]
    end

    def component_params
      { column_id: params[:column_id], position: params[:position] }
    end

    def component_renderable_params
      params.require(:component).permit!
    end

  end
end
