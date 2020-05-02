# frozen_string_literal: true

module Backoffice
  class DiagramsController < BackofficeController
    def index
      %x(bundle exec erd --filename='public/diagram')
    end
  end
end
