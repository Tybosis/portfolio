require "test_helper"

feature "Visiting The Article Index" do

  scenario "visitors should see all published posts" do
  end

  scenario "authors should see all their own posts, published and unpublished" do
  end

  scenario "editors should see all posts, published and unpublished" do
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
