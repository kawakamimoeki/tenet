RSpec.describe Tenet::MultiPages do
  class TestingMultiPages < Tenet::MultiPages
    urls [
      "http://localhost:8000/events/1.html",
      "http://localhost:8000/events/2.html"
    ]

    attribute :title, css: ".event__title"
    attribute :status, css: ".event__status"
  end

  describe "#to_a" do
    it {
      expected = [
        {
          title: "Event 1",
          status: "Open"
        },
        {
          title: "Event 2",
          status: "Close"
        }
      ]
      is_asserted_by { TestingMultiPages.new.to_a == expected }
    }
  end
end
