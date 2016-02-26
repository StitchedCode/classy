# frozen_string_literal: true
module FeatureHelpers
  # Works similarily to Devise's built-in `sign_in`, but directly requesting
  # sign in controller to setup user login instead of mocking. User must
  # have passw0rd as password or you must provide password as a second
  # argument to this method.
  #
  #    before do
  #      sign_in create(:user), 'password'
  #    end
  #
  def sign_in(user, password = 'passw0rd')
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: password
    click_button 'Sign In'

    # Verify that user was successfully logged in.
    # expect(page).to have_content(user.full_name)
    # expect(page).to have_content('Sign Out')
    # expect(page).to have_selector('.sw-settings-btn')
    # expect(page).to have_link('Sign out', :visible => false)
  end

  # Works similarily to Devise's built-in `sign_out`, but directly requesting
  # sign in controller to setup user login instead of mocking.
  #
  #    before do
  #      sign_out
  #      sign_in create(:user), 'password'
  #    end
  #
  # def sign_out
  #   find('header a.dropdown-toggle').click
  #   click_on 'Sign out'

  #   # Verify that user was successfully logged out back to the landing page
  #   expect(page).to have_content 'Beautiful Wikis for Teams'
  # end
end
