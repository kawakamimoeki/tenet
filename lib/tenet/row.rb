require "nokogiri"

module Tenet
  class Row
    #
    # @param [String] html
    # @param [Hash] attributes
    #
    def initialize(html, attributes, parser = Nokogiri::HTML5)
      @html = html
      @attributes = attributes
      @document = parser.parse(@html)
    end

    #
    # @return [Hash]
    #
    def to_h
      values = {}

      @attributes.each do |attribute|
        selector = @document.css(attribute.css).first

        case attribute.type
        when :string
          value = selector.content
        when :link
          value = selector[:href]
        when :img
          value = selector[:src]
        end

        values[attribute.name] = value
      end

      values
    end
  end
end
