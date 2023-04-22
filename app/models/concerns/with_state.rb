# frozen_string_literal: true

module WithState
  extend ActiveSupport::Concern

  included do
    scope :with_state, lambda { |state|
      # Filter using main table, to avoid ambigous when joins
      where("#{table_name}.state = ?", state)
    }
  end
end