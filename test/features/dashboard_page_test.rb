require_relative '../test_helper'

class HomePageTest < FeatureTest
  def test_welcome_message
    visit "/"
    within(".intro-message") do
      assert page.has_content? ("Welcome")
    end
  end
end
