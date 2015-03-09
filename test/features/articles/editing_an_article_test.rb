require "test_helper"

feature "Editing An Article" do
  scenario "submit new content to edit an existing article" do
    # Given that an article exits on the page
    visit article_path(articles(:article_1))
    page.text.must_include 'Edit'
    # When I click edit I can update the title and content with new text
    click_on 'Edit'
    fill_in('Title', with: 'This is the New Title')
    fill_in('Content', with: 'And this is the new content')
    click_on 'Update'
    # Then the article should display on the page with new content and a
    # confirmation message
    page.text.must_include 'Article was successfully updated'
    page.text.must_include 'This is the New Title'
  end
end
