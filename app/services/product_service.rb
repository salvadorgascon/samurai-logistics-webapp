# frozen_string_literal: true

class ProductService
  def update_all_search_text
    Rails.logger.debug "Update search text column on 'products' table"

    ActiveRecord::Base.connection.execute(
      <<-SQL.squish
        UPDATE products set search_text = to_tsvector('spanish', CONCAT(code, ' ', name))
      SQL
    )
  end

  def update_search_text(product_id)
    Rails.logger.debug "Update search text column on 'products' table"

    statement =
      <<-SQL.squish
         UPDATE products set search_text = to_tsvector('spanish', CONCAT(code, ' ', name)) where id = $1
      SQL

    ActiveRecord::Base.connection.raw_connection.exec_params(statement, [product_id])
  end
end