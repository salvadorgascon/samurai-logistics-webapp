module MuiDataGrid
  extend ActiveSupport::Concern

  def mui_data_grid_build_result(rows)
    {
      data: rows
    }
  end
end
