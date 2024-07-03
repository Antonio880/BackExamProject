# frozen_string_literal: true
module Users
  module Organizers
    class Login
      include Interactor::Organizer

      organize(
        Users::Interactors::Login,
        Tokens::Interactors::Generate
      )
    end
  end
end