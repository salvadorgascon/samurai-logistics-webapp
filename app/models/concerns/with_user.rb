# frozen_string_literal: true

module WithUser
  extend ActiveSupport::Concern

  included do
    scope :with_user, lambda { |user_id|
      # Filter using main table, to avoid ambigous when joins
      where("#{table_name}.user_id = ?", user_id)
    }
  end
end