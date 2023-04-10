module ControllerMacros
  def connect_user
    before do
      @request.env['devise.mapping'] = Devise.mappings[:user]

      @current_user = create(:user)
      sign_in(@current_user)

      # Set session variables similar on application controller
    end
  end
end
