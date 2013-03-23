require_dependency "scroll/insert_record"

module Scroll
  class Row < Scroll::Model
    belongs_to :page
    has_many :columns, dependent: :destroy

    def children
      columns.order(:position)
    end

    def insert_at_position
      page.children.insert_at position, self
    end

    def create_columns_from_format(format = [])
      format.each_with_index.map do |size,position|
        Column.create size: size, position: position, row_id: id
      end
    end

    def self.create_from_format(format, params)
      if row = create(params)
        row.insert_at_position if row.page_id.present? && row.position.present?
        row.create_columns_from_format(format) if format
        row
      end
    end

    def self.insert_at(position, row)
      InsertRecord.new(row, position, all).run!
    end
  end
end
