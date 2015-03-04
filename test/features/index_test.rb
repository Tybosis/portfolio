require 'test_helper'

describe 'my portfolio home page' do
  it 'shows the welcome page' do
    visit 'http://localhost:3000'
    page.text.must_include 'Hello!'
  end
end
