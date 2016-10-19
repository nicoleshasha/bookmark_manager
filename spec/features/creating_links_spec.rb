require 'spec_helper'

feature 'creating links' do
  scenario 'add site\'s address and title to bookmark manager' do
    visit '/links/new'
    fill_in('title', :with => "Google")
    fill_in('url', :with => "www.google.co.uk")
    click_button('Submit')
    expect(page).to have_content "Google"
  end
end
