# frozen_string_literal: true

module Backoffice
  class DiagramsController < BackofficeController
    def index
      `bundle exec erd --filename='public/diagram'`
    end
  end
end
