require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('the contact path', {:type => :feature}) do
  it('displays the id of added contacts after the user submits the form') do
    visit('/words/new')
    fill_in('Word:', :with => "word")
    click_button('Add Word')
    expect(page).to have_content('Success!')
  end
end
