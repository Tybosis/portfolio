require "test_helper"

feature "Creating a project to show off my skills" do
  scenario "submit content to create a new project" do
    visit projects_path
    click_on 'New Project'
    fill_in('Title', with: "My Project")
    fill_in('Technologies used', with: 'Ruby, Rails, Sass, Javascript, HTML5')
    click_on 'Create Project'
    page.text.must_include 'Project has been created.'
    page.text.must_include 'Technologies Used: Ruby, Rails, Sass, Javascript, HTML5'
    page.status_code.must_equal 200
  end

  scenario "submit empty technologies used to return an error" do
    visit projects_path
    click_on 'New Project'
    fill_in('Title', with: 'X')
    click_on 'Create Project'
    current_path.must_match(/projects$/)
    page.text.must_include 'Project could not be saved'
    page.text.must_include "Technologies used can't be blank"
    page.text.must_include "Title is too short"
  end

  scenario "submit empty project title to return an error" do
    visit projects_path
    click_on 'New Project'
    fill_in('Technologies used', with: 'Rails, Ruby, Sass')
    click_on 'Create Project'
    current_path.must_match(/projects$/)
    page.text.must_include 'Project could not be saved'
    page.text.must_include "Title can't be blank"
  end
end
