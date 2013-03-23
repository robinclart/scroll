module Scroll
  class Page < Scroll::Model
    has_many :rows, dependent: :destroy

    def children
      rows.order :position
    end
  end
end
