# frozen_string_literal: true

Dir.glob(__dir__ + "/tenet/**/*.rb").each { |f| require_relative f }

module Tenet
end
