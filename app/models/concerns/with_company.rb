# frozen_string_literal: true

module WithCompany
  extend ActiveSupport::Concern

  included do
    scope :with_company, lambda { |company_id|
      # Filter using main table, to avoid ambigous when joins
      where("#{table_name}.company_id = ?", company_id)
    }
  end
end
