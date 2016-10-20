require 'spec_helper.rb'

feature 'prints links' do
  scenario 'prints list of links on homepage' do
    Link.create(url: 'http://www.makersacademy.com', title: 'Makers Academy')
    visit '/links'
    expect(page.status_code).to eq 200
    #within 'ul#links' do
    expect(page).to have_content('Makers Academy')
    #end
  end
end

feature 'add multiple tags' do
  scenario 'create link with multiple tags' do
    visit '/links/new'
    fill_in 'url', with: 'http://www.makersacademy.com'
    fill_in 'title', with: 'Makers Academy'
    fill_in 'tags', with: 'education ruby'
    click_button 'Submit'
    link=Link.first
    expect(link.tags.map(&:name)).to include("education", "ruby")
  end
end
