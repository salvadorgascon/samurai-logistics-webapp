require 'rails_helper'

RSpec.describe 'Web::CustomerListController', type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: "/web/customer_list/index").to route_to("web/customer_list#index")
    end
  end
end
