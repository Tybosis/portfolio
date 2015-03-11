require "test_helper"

feature "Creating An Article" do
  scenario "submit content to create a new article" do
    # Given that I am on the articles page.
    visit new_article_path
    # When I want to create a new article and submit valid content.
    sign_in
    fill_in('Title', with: 'News')
    fill_in('Content', with: 'Metropolis is a great place to live.')
    click_on 'Create'
    # Then a new article should be created with a confirmation message.
    page.text.must_include 'Article was successfully created'
    page.text.must_include 'Metropolis is a great place to live.'
    page.has_css? "#author"
    page.text.must_include users(:superman).email
  end
end
