require_dependency "scroll/insert_record"

module Scroll
  class Component < Scroll::Model
    belongs_to :column
    belongs_to :renderable, polymorphic: true, dependent: :destroy

    class_attribute :types

    def insert_at_position
      column.children.insert_at position, self
    end

    def self.insert_at(position, row)
      InsertRecord.new(row, position, all).run!
    end

    def self.register_type(name)
      self.types ||= []
      self.types << name
    end

    def create_renderable_from_type(type)
      renderable_klass = type.classify.constantize
      self.renderable = renderable_klass.create
      save
    end

    def self.create_from_type(type, params)
      if component = create(params)
        component.insert_at_position if component.column_id.present? && component.position.present?
        component.create_renderable_from_type(type) if type
        component
      end
    end
  end
end
