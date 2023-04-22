# frozen_string_literal: true

module Contains
  extend ActiveSupport::Concern

  included do
    scope :contains, lambda { |name, pattern|
      # Filter using main table, to avoid ambigous when joins
      where("unaccent(#{table_name}.#{name}) ilike unaccent(?)", pattern)
    }
  end
end