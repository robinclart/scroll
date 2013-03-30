module Scroll
  module Config
    mattr_accessor :engine_layout
    mattr_accessor :helpers
    mattr_accessor :styles

    self.engine_layout = "application"
    self.helpers = []
    self.styles = {}
  end
end
