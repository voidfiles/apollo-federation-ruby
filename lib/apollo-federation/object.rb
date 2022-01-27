# frozen_string_literal: true

require 'apollo-federation/has_directives'
require 'apollo-federation/directives/key'

module ApolloFederation
  module Object
    def self.included(klass)
      klass.extend(ClassMethods)
    end

    module ClassMethods
      include HasDirectives

      def extend_type
        add_directive(name: 'extends')
      end

      def key(fields:)
        directive(ApolloFederation::Directives::Key, fields: fields)

        add_directive(
          name: 'key',
          arguments: [
            name: 'fields',
            values: fields,
          ],
        )
      end
    end
  end
end
