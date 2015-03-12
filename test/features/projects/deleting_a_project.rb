require 'test_helper'

feature "When I am on the Show page, clicking delete link should destroy the given project" do
  scenario "Showing the first project and deleting it" do
    visit projects_path
    all('a').select { |link| link.text == "Show" }.first.click
    click_on 'Destroy'
    page.text.wont_include 'Movie App'
  end
end
