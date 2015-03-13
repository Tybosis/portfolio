require "test_helper"

feature "Deleting An Article" do
  scenario "editors can delete articles from the index page by clicking Delete" do
    # Given that an article exists
    sign_in(:editor)
    visit articles_path
    # When I click a delete link (and confirm deletion)
    page.find('tbody tr:last').click_on 'Destroy'
    # Then the article is deleted and removed from the page
    page.text.wont_include 'Hello World'
  end

  scenario "editors can delete any post" do
    sign_in(:editor)
    visit article_path(articles(:article_1))
    click_on 'Destroy'
    page.text.must_include "Article was successfully destroyed."
  end

  scenario "authors can delete their own unpublished posts" do
    sign_in(:author)
    visit article_path(articles(:article_3))
    click_on 'Destroy'
    page.text.must_include "Article was successfully destroyed."
  end

  scenario "authors cannot delete other authors posts" do
    sign_in(:author)
    visit article_path(articles(:article_1))
    page.text.wont_include 'Destroy'
  end

  scenario "visitors should not see delete links and cannot delete posts" do
    visit article_path(articles(:article_1))
    page.text.wont_include 'Destroy'
    visit articles_path
    page.text.wont_include 'Destroy'
  end
end
