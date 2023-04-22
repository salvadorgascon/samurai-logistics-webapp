# frozen_string_literal: true

module ContainsFts
  extend ActiveSupport::Concern

  included do
    include PgSearch

    pg_search_scope :contains_fts,
      against: :search_text,
      ignoring: :accents,
      using: {
        tsearch: {
          prefix: true,
          dictionary: 'spanish',
          tsvector_column: 'search_text'
        }
      }
  end
end