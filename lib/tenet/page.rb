require "nokogiri"
require "open-uri"

module Tenet
  class Page

    attr_accessor :html, :document

    #
    # @param [String] url
    #
    def initialize(url, parser = Nokogiri::HTML5)
      @html = URI.open(url).string
      @document = parser.parse(@html)
    end
  end
end
