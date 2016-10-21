require 'spec_helper'

feature 'signs up a new user account' do
  scenario 'enters email and password and submits form' do
    visit '/sign_up'
    fill_in('email', :with => "bookmarks4life@hotmail.co.uk")
    fill_in('password', :with => "ilovebookmarks")
    click_button('Submit')
    expect(page).to have_content("Welcome bookmarks4life@hotmail.co.uk")
  end
  scenario 'user count increases by 1' do
    expect(User.count).to eq 1
  end
end
