module Scroll
  module Renderable
    extend ActiveSupport::Concern

    included do
      has_one :component, as: :renderable
    end

    def ever_been_updated?
      updated_at != created_at
    end

    def never_been_updated?
      !ever_been_updated?
    end
  end
end