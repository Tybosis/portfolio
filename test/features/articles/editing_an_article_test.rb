require "test_helper"

feature "Editing An Article" do
  scenario "editors should be able to exit anything existing article" do
    # Given that an article exits on the page
    sign_in(:editor)
    visit article_path(articles(:article_1))
    page.text.must_include 'Edit'
    # When I click edit I can update the title and content with new text
    all('a').select { |link| link.text == "Edit" }.first.click
    fill_in('Title', with: 'This is the New Title')
    fill_in('Content', with: 'And this is the new content')
    click_on 'Update'
    # Then the article should display on the page with new content and a
    # confirmation message
    page.text.must_include 'Article was successfully updated'
    page.text.must_include 'This is the New Title'
  end

  scenario "authors should be able to edit their own unpublished posts" do
    sign_in(:author)
    visit article_path(articles(:article_3))
    click_on 'Edit'
    fill_in('Title', with: 'This is the title I want now')
    fill_in('Content', with: 'I am a great author, guys!')
    click_on 'Update Article'
    page.text.must_include 'great author'
  end

  scenario "authors should not see links to edit posts that arent theirs" do
    sign_in(:author)
    visit article_path(articles(:article_1))
    page.text.wont_include 'Edit'
  end

  scenario "visitors should not be able to edit any post" do
    visit edit_article_path(articles(:article_1))
    page.text.must_include 'You need to sign in or sign up before continuing.'
  end

  scenario "visitors should not be able to see edit links anywhere" do
    visit article_path(articles(:article_1))
    page.text.wont_include 'Edit'
    visit articles_path
    page.text.wont_include 'Edit'
  end
end
