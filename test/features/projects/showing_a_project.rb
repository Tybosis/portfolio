require 'test_helper'

feature "When I am on the projects page, I should be able to view each individual project" do
  scenario "looking at the first project" do
    # Given that I am on the projects page
    visit projects_path
    # When I click show on a given project
    all('a').select { |elt| elt.text == "Show" }.first.click
    # I should be viewing that project alone, and not any other ones
    page.text.must_include 'Movie App'
    page.text.wont_include 'Really Cool'
  end
end
