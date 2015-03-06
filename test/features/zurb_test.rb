require 'test_helper'

describe 'Foundation' do
  it 'should have a stylesheet file in the project' do
    # Given that I want Zurb Foundation to be included in my project
    # When I check for the file in the app/stylesheets folder
    # It should be there
    File.exist?('app/assets/stylesheets/foundation_and_overrides.scss').must_equal(true)
  end

  it 'should have some keywords used in the project' do
    # Given that I am actually using Foundation
    # When I look at some html
    content = File.read('app/views/articles/_form.html.erb')
    # I should see some Foundation keywords
    content.must_include 'columns'
  end

  it 'should be a gem in my gemfile' do
    # Given that Zurb Foundation is installed
    # When I scan through the gemfile
    content = File.read('Gemfile')
    # There should be a Zurb in there somewhere!
    content.must_include 'foundation-rails'
  end
end
