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

feature 'multiple tags on links' do
  scenario 'allows multiple tags for the same link' do
    Link.create(url: 'http://www.makersacademy.com', title: 'Makers Academy', tags: 'education', tags: 'coding')
    visit '/tags/education'
    expect(page).to have_content('Makers Academy')
    visit 'tags/coding'
    expect(page).to have_content('Makers Academy')
  end
end
