module Tenet
  class Attribute
    TYPE_OPTIONS = [:string, :img, :link]

    attr_accessor :name, :css, :type

    #
    # @param [Symbol] name
    # @param [String] css
    # @param [Symbol] type
    #
    def initialize(name, css:, type: :string)
      raise ArgumentError unless TYPE_OPTIONS.include?(type)
      @name = name
      @css = css
      @type = type
    end
  end
end
