require 'test_helper'

describe 'my portfolio home page' do
  before do
    visit 'http://www.tylerpottle.com'
  end

  it 'includes an About Me title' do
    page.text.must_include 'About Me'
  end

  it 'includes a titles for contact links' do
    page.html.must_include 'twitter'
  end
end
