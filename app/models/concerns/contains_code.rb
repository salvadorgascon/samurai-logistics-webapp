# frozen_string_literal: true

module ContainsCode
  extend ActiveSupport::Concern

  included do
    scope :contains_code, lambda { |pattern|
      # Filter using main table, to avoid ambigous when joins
      where("unaccent(#{table_name}.code) ilike unaccent(?)", pattern)
    }
  end
end