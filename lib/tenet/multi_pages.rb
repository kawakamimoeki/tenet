module Tenet
  class MultiPages

    @@urls = []
    @@attributes = []

    class << self
      #
      # @param [Array] urls
      #
      def urls(urls)
        @@urls = urls
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

      @@urls.each do |url|
        html = Page.new(url).html
        @collection << Row.new(html, @@attributes).to_h
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
