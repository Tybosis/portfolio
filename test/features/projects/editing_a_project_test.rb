require "test_helper"

feature "editing an existing project with new content" do
  scenario "submit new content to update a project" do
    # Given when I visit the projects page
    visit edit_project_path(projects(:portfolio))
    # Then the project should successfully be updated with new content
    fill_in('Title', with: 'New Title')
    fill_in('Technologies used', with: 'PHP, Perl, Visual Basic')
    click_on 'Update Project'
    # With a success flash message
    page.text.must_include "New Title"
    page.text.must_match(/PHP/)
  end

  scenario "submit invalid content" do
    # Given that a project exits
    visit edit_project_path(projects(:portfolio))
    # When I try to edit the content of that project with invalid data
    fill_in('Title', with: 'X')
    click_on 'Update Project'
    # The content should not be updated and the edit page should appear again.
    page.text.must_include 'Project could not be updated'
    page.text.must_include "Title is too short"
  end
end
