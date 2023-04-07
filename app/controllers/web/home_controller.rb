module Web  
  class HomeController < ApplicationController
    def index
      render(layout: 'default')
    end
  end
end