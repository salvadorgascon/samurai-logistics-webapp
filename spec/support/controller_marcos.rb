module ControllerMacros
  def connect_user
    before do
      @current_user = create(:user)

      @request.env['devise.mapping'] = Devise.mappings[:user]
      sign_in @current_user

      # Set session variables similar on application controller
    end
  end
end
