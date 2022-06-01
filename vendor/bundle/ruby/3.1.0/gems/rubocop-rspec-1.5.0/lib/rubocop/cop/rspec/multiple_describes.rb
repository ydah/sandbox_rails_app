# encoding: utf-8
# frozen_string_literal: true

module RuboCop
  module Cop
    module RSpec
      # Checks for multiple top level describes. They should be nested if it is
      # for the same class or module or seperated into different files.
      #
      # @example
      #   # bad
      #   describe MyClass, '.do_someting' do
      #   end
      #   describe MyClass, '.do_someting_else' do
      #   end
      #
      #   #good
      #   describe MyClass
      #     describe '.do_someting' do
      #     end
      #     describe '.do_someting_else' do
      #     end
      #   end
      class MultipleDescribes < Cop
        include RuboCop::RSpec::TopLevelDescribe

        MSG = 'Do not use multiple top level describes - ' \
              'try to nest them.'.freeze

        def on_top_level_describe(node, _args)
          return if single_top_level_describe?
          return unless top_level_nodes.first == node

          add_offense(node, :expression, MSG)
        end
      end
    end
  end
end
