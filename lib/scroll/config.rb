module Scroll
  module Config
    mattr_accessor :engine_layout
    mattr_accessor :helpers

    self.engine_layout = "application"
    self.helpers = []
  end
end
