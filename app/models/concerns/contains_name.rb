# frozen_string_literal: true

module ContainsName
  extend ActiveSupport::Concern

  included do
    scope :contains_name, lambda { |pattern|
      # Filter using main table, to avoid ambigous when joins
      where("unaccent(#{table_name}.name) ilike unaccent(?)", pattern)
    }
  end
end