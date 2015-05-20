require_relative '../test_helper'

class UpdateTaskTest < FeatureTest
  def test_edit_an_existing_task
    TaskManager.create(title: "Practice Capybara",
                    description: "tonight")
    visit '/tasks'
    click_link "Edit"

    assert_equal '/tasks/1/edit', current_path

    fill_in "task[title]", with: "Practice SQL"
    fill_in "task[description]", with: "tomorrow"
    click_link_or_button "edit"

    assert page.has_content?("Practice SQL")
    assert page.has_content?("tomorrow")

    refute page.has_content?("Practice Capybara")
  end
end
