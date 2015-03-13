require "test_helper"

feature "Visiting The Article Index" do

  scenario "visitors should see all published posts" do
    visit articles_path
    page.text.wont_include 'work in progress'
  end

  scenario "authors should see all their own posts, published and unpublished" do
    sign_in(:author)
    visit articles_path
    page.text.must_include 'work in progress'
    page.text.must_include 'Articles are fun to write'
    page.text.wont_include 'Cheeseburger'
  end

  scenario "editors should see all posts, published and unpublished" do
    sign_in(:editor)
    visit articles_path
    page.text.must_include 'Hello World'
    page.text.must_include 'work in progress'
    page.text.must_include 'Cheeseburger'
  end

end

feature "Visiting the article Index" do
  scenario 'With an existing article' do
    # Given that a post exists
    # When a user visits the articles page
    visit articles_path
    # Then a new page should load displaying that post
    page.text.must_include 'Hello World'
  end
end
