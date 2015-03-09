require "test_helper"

feature "Deleting An Article" do
  scenario "delete an existing article by clicking Delete" do
    # Given that an article exists
    visit articles_path
    # When I click a delete link (and confirm deletion)
    page.find('tbody tr:last').click_on 'Destroy'
    # Then the article is deleted and removed from the page
    page.text.wont_include 'Hello World'
  end
end
