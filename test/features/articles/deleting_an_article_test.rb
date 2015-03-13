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

  scenario "authors can delete their own posts" do
  end

  scenario "authors cannot delete other authors posts" do
  end

  scenario "authors do see delete links on posts that aren't theirs" do
  end

  scenario "editors can delete any post" do
  end

  scenario "visitors should not see delete links and cannot delete posts" do
  end
end
