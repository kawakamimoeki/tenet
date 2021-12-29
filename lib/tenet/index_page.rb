module Tenet
  class IndexPage

    @@url = ""
    @@row = ""
    @@attributes = []

    class << self
      #
      # @param [String] url
      #
      def url(url)
        @@url = url
      end

      #
      # @param [String] css
      #
      def row(css)
        @@row = css
      end

      #
      # @param [Symbol] name
      # @param [String] css
      # @param [Symbol] type
      #
      def attribute(name, css:, type: :string)
        @@attributes << Attribute.new(name, css: css, type: type)
      end
    end

    def initialize
      @collection = []

      Page.new(@@url).document.css(@@row).each do |row_document|
        @collection << Row.new(row_document.to_html, @@attributes).to_h
      end
    end

    #
    # @return [Array<Hash>]
    #
    def to_a
      @collection
    end
  end
end
