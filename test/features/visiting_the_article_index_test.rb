require "test_helper"

feature "Visiting The Article Index" do

  scenario "lists all posts on the articles page" do
    # Given that there are multiple posts
    # When a user visits the page
    # Then all of the blog posts should be displayed
  end

end

feature "Visiting the Post Index" do
  scenario 'With an existing post' do
    # Given that a post exists
    # When a user visits the articles page
    visit articles_path
    # Then a new page should load displaying that post
    page.text.must_include 'Hello World'
  end
end
