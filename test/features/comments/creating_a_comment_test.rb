require 'test_helper'

feature "Users can add comments and authors and editors can approve them" do
  scenario "Visitors can post comments, but they don't show up until published" do
    visit article_path(articles(:article_1))
    fill_in('Content', with: 'This is a comment')
    click_on 'Create Comment'
    page.text.must_include 'Comment was successfully created'
    page.text.wont_include 'This is a comment'
  end

  scenario "Visitors can see approved comments on that articles show page" do
    visit article_path(articles(:article_1))
    page.text.must_include 'This article rules!'
    page.text.wont_include 'This article sucks!'
  end

  scenario "Editors can approve comments" do
    sign_in(:editor)
    visit article_path(articles(:article_1))
    fill_in('Content', with: 'My comment')
    click_on 'Create Comment'
    all('a').select { |link| link.text == "Edit" }.last.click
    first("input[type='checkbox']").click
    click_on 'Update Comment'
    page.text.must_include 'Comment was successfully approved'
  end

  scenario "Editors can reject comments" do
    sign_in(:editor)
    visit article_path(articles(:article_1))
    fill_in('Content', with: 'My comment')
    click_on 'Create Comment'
    all('a').select { |link| link.text == "Destroy" }.last.click
    page.text.must_include 'Comment was successfully destroyed'
    page.text.wont_include 'My comment!'
  end

  scenario "Editors can create comments and approve them" do
    sign_in(:editor)
    visit article_path(articles(:article_1))
    fill_in('Content', with: 'WTF is this?')
    click_on 'Create Comment'
    page.text.must_include 'Comment was successfully created'
    all('a').select { |link| link.text == "Edit" }.last.click
    check 'comment_approved'
    click_on 'Update Comment'
    page.text.must_include 'Comment was successfully approved'
    page.text.must_include 'WTF is this?'
  end
end
