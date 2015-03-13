require "test_helper"

feature "Visiting The Article Index" do

  scenario "visitors should see all published articles" do
    visit articles_path
    page.text.wont_include 'work in progress'
  end

  scenario "authors should see all their own articles, published and unpublished" do
    sign_in(:author)
    visit articles_path
    page.text.must_include 'work in progress' # Authors unpublished article
    page.text.must_include 'Articles are fun to write' # Published article by the author
    page.text.wont_include 'Cheeseburger' # Unpublished article by a different author
    page.text.must_include 'Hello World' # Published article by a different author
  end

  scenario "editors should see all articles, published and unpublished" do
    sign_in(:editor)
    visit articles_path
    page.text.must_include 'Hello World' # Published article
    page.text.must_include 'work in progress' # Unpublished article
    page.text.must_include 'Cheeseburger' # Unpublished article by another author
  end

end

feature "Visiting the article Index" do
  scenario 'With an existing article' do
    # Given that a article exists
    # When a user visits the articles page
    visit articles_path
    # Then a new page should load displaying that article
    page.text.must_include 'Hello World' # Published article that anyone can see.
  end
end
