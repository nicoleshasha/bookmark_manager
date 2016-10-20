require 'spec_helper.rb'

feature 'tags links' do
  scenario 'organise links into categories with tags' do
    visit '/links/new'
    fill_in 'url', with: "www.makersacademy.com"
    fill_in 'title', with: "Makers Academy"
    fill_in 'tags', with: 'education'
    click_button 'Submit'
    link = Link.first
    expect(link.tags.map(&:name)).to include('education')
  end
end

feature 'organises by tag' do
  scenario 'sort pages into categories of tag' do
    visit '/links/new'
    fill_in 'url', with: "www.bubbles.com"
    fill_in 'title', with: "Bubbly fun"
    fill_in 'tags', with: 'bubbles'
    click_button 'Submit'
    visit '/tags/bubbles'
    expect(page).to have_content('www.bubbles.com')
  end
scenario 'doesn\'t include non bubbles tags' do
  visit '/links/new'
  fill_in 'url', with: "www.makersacademy.com"
  fill_in 'title', with: "Makers Academy"
  fill_in 'tags', with: 'education'
  click_button 'Submit'
  visit '/tags/bubbles'
  expect(page).to_not have_content('www.makersacademy.com')
end
end
