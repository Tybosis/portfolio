require 'test_helper'

describe 'my portfolio home page' do
  before do
    visit 'http://localhost:3000'
  end

  it 'includes an About Me title' do
    page.text.must_include 'About Me'
  end

  it 'includes an unordered list with class info' do
    page.html.must_include "<ul class='info'>"
  end

  it 'includes an unordered list with contact info info' do
    page.html.must_include "<ul class='contact info'>"
  end

  it 'includes a titles for contact links' do
    page.text.must_include 'twitter'
    page.text.must_include 'email'
    page.text.must_include 'Github'
  end
end
