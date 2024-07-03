# frozen_string_literal: true
module Users
  module Organizers
    class Register 
      include Interactor::Organizer
    
      organize(
        Users::Interactors::Create,
        Tokens::Interactors::Generate
      )
    end
  end
end
