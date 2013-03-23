require "scroll/engine"
require "scroll/config"

module Scroll
  # Used to configure Scroll
  #
  # Example:
  #
  #   Scroll.configure do |config|
  #     config.layout = "website"
  #   end
  def self.configure(&block)
    yield config
  end

  def self.config
    Scroll::Config
  end
end
