module Web
  class WebController < ApplicationController
    before_action :authenticate_user!
    before_action :set_current_user

    private

    def set_current_user
      @current_user = current_user
    end
  end
end