require 'rails_helper'

RSpec.describe 'Web::HomeController', type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: "/web/home/index").to route_to("web/home#index")
    end
  end
end
