require_relative '../test_helper'

class TaskManagerTest < ModelTest

  def test_can_create_a_task
    data = {:title => "learn sinatra",
            :description => "seriously."}

    TaskManager.create(data)
    task = TaskManager.find(1)

    assert_equal "learn sinatra", task.title
    assert_equal "seriously.", task.description
    assert_equal 1, task.id
  end
end
