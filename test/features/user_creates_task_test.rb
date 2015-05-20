require_relative '../test_helper'

class CreateTaskTest < FeatureTest
  def test_a_user_can_create_a_task
    visit "/tasks/new"
    fill_in('task[title]', with: "do something")
    fill_in('task[description]', with: "yep")
    click_button ("submit")

    within(".new_task") do
      assert page.has_content?("do something")
    end
  end
end

#input
# fill_in('First Name', with: 'John')
# fill_in('Password', with: 'Seekrit')
# fill_in('Description', with: 'Really Long Text…')
