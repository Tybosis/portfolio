require 'test_helper'

feature 'As a visitor, I want to see a list of projects the developer has worked on' do
  scenario 'viewing a list of all projects' do
    visit projects_path
    page.text.must_include 'portfolio'
    page.text.must_include 'freelance'
    page.text.must_include 'Ruby'
  end
end
