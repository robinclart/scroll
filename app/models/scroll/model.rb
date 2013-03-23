require_dependency "strong_parameters"

module Scroll
  class Model < ActiveRecord::Base
    self.abstract_class = true

    include ActiveModel::ForbiddenAttributesProtection
  end
end