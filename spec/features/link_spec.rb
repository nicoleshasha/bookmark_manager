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