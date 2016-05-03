require 'rails_helper'

RSpec.feature "Following / Unfollowing users" do

  let(:luke) { create(:user, username: "Luke Skywalker") }
  let(:solo) { create(:user, username: "Han Solo") }

  scenario "signed-in user can follow and unfollow other users" do
    sign_in luke
    visit user_path(solo)
    click_on "Follow"
    expect(page).not_to have_button("Follow")
    expect(page).to have_button("Unfollow")
    click_on "Unfollow"
    expect(page).not_to have_button("Unfollow")
    expect(page).to have_button("Follow")
  end
end
