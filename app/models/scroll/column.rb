module Scroll
  class Column < Scroll::Model
    belongs_to :row
    has_many :components, dependent: :destroy

    class_attribute :formats

    def children
      components.order(:position)
    end

    def self.register_format(name, format)
      self.formats ||= {}
      self.formats[name] = format
    end

    register_format :full_width, "12"
    register_format :two_columns, "6-6"
    register_format :three_columns, "4-4-4"
    register_format :four_columns, "3-3-3-3"
    register_format :centered_column, "2-8-2"
    register_format :large_left, "8-4"
    register_format :large_right, "4-8"

    def self.normalize_format(format)
      format.nil? ? [12] : format.split("-").map(&:to_i)
    end
  end
end
