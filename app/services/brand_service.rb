# frozen_string_literal: true

class BrandService
  def update_all_search_text
    Rails.logger.debug "Update search text column on 'brands' table"

    ActiveRecord::Base.connection.execute(
      <<-SQL.squish
        UPDATE brands set search_text = to_tsvector('spanish', CONCAT(code, ' ', name))
      SQL
    )
  end

  def update_search_text(brand_id)
    Rails.logger.debug "Update search text column on 'brands' table"

    statement =
      <<-SQL.squish
         UPDATE brands set search_text = to_tsvector('spanish', CONCAT(code, ' ', name)) where id = $1
      SQL

    ActiveRecord::Base.connection.raw_connection.exec_params(statement, [brand_id])
  end
end
