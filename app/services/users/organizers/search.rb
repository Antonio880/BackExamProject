# frozen_string_literal: true
module Users
  module Organizers
    class Search
      include Interactor::Organizer

      organize(
        Users::Interactors::Search,
      )
    end
  end
end