# frozen_string_literal: true

module WithUid
  extend ActiveSupport::Concern

  included do
    scope :with_uid, lambda { |uid|
      # Filter using main table, to avoid ambigous when joins
      where("#{table_name}.uid = ?", uid)
    }
  end
end