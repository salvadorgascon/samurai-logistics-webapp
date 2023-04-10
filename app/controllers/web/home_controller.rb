module Web  
  class HomeController < Web::WebController
    def index
      render(layout: 'default')
    end
  end
end