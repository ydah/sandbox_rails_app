# encoding: utf-8

module RuboCop
  module Cop
    module RSpec
      # Enforces the usage of the same method on all negative message
      # expectations.
      #
      # @example
      #   # bad
      #   it '...' do
      #     expect(false).to_not be_true
      #   end
      #
      #   # good
      #   it '...' do
      #     expect(false).not_to be_true
      #   end
      class NotToNot < Cop
        include RuboCop::Cop::ConfigurableEnforcedStyle

        MSG = 'Prefer `%s` over `%s`'.freeze

        METHOD_NAMES = [:not_to, :to_not].freeze

        def on_send(node)
          _receiver, method_name, *_args = *node

          return unless METHOD_NAMES.include?(method_name)

          return if style == method_name
          add_offense(node, :expression)
        end

        def message(node)
          _receiver, method_name, *_args = *node

          if method_name == :not_to
            format(MSG, 'to_not', 'not_to')
          else
            format(MSG, 'not_to', 'to_not')
          end
        end

        def autocorrect(node)
          _receiver, method_name, *_args = *node
          lambda do |corrector|
            corrector.replace(node.loc.selector,
                              method_name == :not_to ? 'to_not' : 'not_to')
          end
        end
      end
    end
  end
end
