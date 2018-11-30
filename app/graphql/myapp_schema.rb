# frozen_string_literal: true

class MyappSchema < GraphQL::Schema
  mutation(Types::MutationType)
  query(Types::QueryType)
end
