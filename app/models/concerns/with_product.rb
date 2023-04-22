# frozen_string_literal: true

module WithProduct
  extend ActiveSupport::Concern

  included do
    scope :with_product, lambda { |product_id|
      # Filter using main table, to avoid ambigous when joins
      where("#{table_name}.product_id = ?", product_id)
    }
  end
end