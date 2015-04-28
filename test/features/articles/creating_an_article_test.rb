require "test_helper"

feature "Creating An Article" do
  scenario "submit content to create a new article" do
    # Given that I am on the articles page.
    visit new_article_path
    # When I want to create a new article and submit valid content.
    sign_in(:author)
    fill_in('Title', with: 'News')
    fill_in('Content', with: 'Metropolis is a great place to live.')
    click_on 'Create'
    # Then a new article should be created with a confirmation message.
    page.text.must_include 'Article was successfully created'
    page.text.must_include 'Metropolis is a great place'
    page.has_css? "#author"
    page.text.must_include users(:author).email
    page.text.must_include("Status: Unpublished")
  end

  scenario "unathenticated site visitors cannot visit new_article_path" do
    visit new_article_path
    page.must_have_content "You need to sign in or sign up before continuing"
  end

  scenario "unauthenticated site visitors cannot see new article button" do
    visit articles_path
    sign_in(:author)
    page.must_have_content "New Article"
  end

  scenario "authors can't publish" do
    sign_in(:author)
    visit articles_path
    click_on 'New Article'
    page.wont_have_field("published")
  end

  scenario "editors can publish" do
    sign_in(:editor)
    visit articles_path
    click_on "New Article"
    page.must_have_field("Published")
    fill_in "Title", with: articles(:article_1).title
    fill_in "Content", with: articles(:article_1).content
  end
end
