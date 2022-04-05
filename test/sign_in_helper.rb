# frozen_string_literal: true
module SignInHelper
  def sign_in
    visit root_path
    fill_in 'user_email', with: 'alice@example.com'
    fill_in 'user_password', with: 'aliali'
    click_button 'ログイン'

  end
end