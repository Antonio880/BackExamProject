# frozen_string_literal: true
module Users
  module Interactors
    class Search
      include Interactor

      delegate :query, to: :context

      def call
        search
      end

      private 

      def search
        if query.present?
          context.users = User.where('LOWER(username) LIKE ?', "%#{context.query.downcase}%")
        else 
          context.users = User.all
        end
      end
    end
  end
end
