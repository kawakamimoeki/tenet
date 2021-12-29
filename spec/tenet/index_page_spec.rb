RSpec.describe Tenet::IndexPage do
  class TestingIndexPage < Tenet::IndexPage
    url "http://localhost:8000/events"

    row ".event"

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
      is_asserted_by { TestingIndexPage.new.to_a == expected }
    }
  end
end
