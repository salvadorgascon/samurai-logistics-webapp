module RequestMacros
  def connect_user
    before do
      current_user = create(:user)
      sign_in current_user
    end
  end
end