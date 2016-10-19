require 'spec_helper'

feature 'creating links' do
  scenario 'add site\'s address and title to bookmark manager' do
    visit '/links/new'
    fill_in('Title', :with => "Google")
    fill_in('URL', :with => "www.google.co.uk")
    click_button('submit')
    expect(page).to have_content "Google"
  end
end
