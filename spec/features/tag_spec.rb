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
  before(:each) do
    visit '/links/new'
    fill_in 'url', with: "www.bubbles.com"
    fill_in 'title', with: "Bubbly fun"
    fill_in 'tags', with: 'bubbles'
    click_button 'Submit'
    visit '/links/new'
    fill_in 'url', with: "www.makersacademy.com"
    fill_in 'title', with: "Makers Academy"
    fill_in 'tags', with: 'education'
    click_button 'Submit'
  end

  scenario 'display pages by tag' do
    visit '/tags/bubbles'

    expect(page.status_code).to eq(200)
    within 'ul#links' do
      expect(page).to have_content('www.bubbles.com')
      expect(page).to_not have_content('www.makersacademy.com')
    end
  end
end
