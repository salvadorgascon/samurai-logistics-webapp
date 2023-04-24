# frozen_string_literal: true

module Web
  class CustomerListController < ApplicationController
    include Pagy::Backend
    include MuiDataGrid

    def index
      ActiveRecord::Base.transaction do
        page_number = 1
        page_size = 10

        order_field = 'name'
        order_direction = 'asc'

        query_count = Customer.all
        rows_count = query_count.size

        query_rows = Customer.all
        query_rows = query_rows.order("#{order_field} #{order_direction}")

        _paginator, query_rows = pagy(
          query_rows,
          page: page_number,
          items: page_size,
          count: rows_count
        )

        object_customers  = []

        query_rows.each do |customer|
          object_customers << {
            uid: customer.uid,
            code: customer.code,
            name: customer.name,
            ein_number: customer.ein_number,
            vat_number: customer.vat_number,
            tin_number: customer.tin_number,
            state: customer.state
          }
        end

        result = mui_data_grid_build_result(object_customers)

        render(json: Oj.dump(result, mode: :compat))
      end
    end
  end
end
