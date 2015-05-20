require_relative '../test_helper'

class DeleteTaskTest < FeatureTest
  def test_user_can_delete_task
    TaskManager.create(title: "do homework", description: "boo")
    visit "/tasks"

    assert page.has_content?("do homework")

    click_on "Delete"

    refute page.has_content?("boo")
  end


  # def test_a_user_can_delete_a_task
  #   visit "/tasks/new"
  #   fill_in('task[title]', with: "do something")
  #   fill_in('task[description]', with: "yep")
  #   click_button ("submit")
  #
  #   within(".task") do
  #     assert page.has_content?("do something")
  #   end
  #
  #   visit '/tasks'
  #   click_button("Delete")
  #
  #   within(".task") do
  #     refute page.has_content?("do something")
  #   end
  #
  # end
end
