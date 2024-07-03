# frozen_string_literal: true
module Users
  module Organizers
    class Verify
      include Interactor::Organizer

      organize(
        Tokens::Interactors::Decode,
        Users::Interactors::Find
      ) 
    end
  end
end
