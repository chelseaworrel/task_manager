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

  def create_tasks(num)
    num.times do |x|
      TaskManager.create(title: "task#{x}",
                         description: "description#{x}")
    end
  end

  def test_it_can_find_task_by_id
    create_tasks(3)
    task = TaskManager.find(2)

    assert_equal "task1", task.title
    assert_equal "description1", task.description
    assert_equal 2, task.id
  end

  def test_it_can_find_all_the_tasks
    create_tasks(3)

    assert_equal 3, TaskManager.all.count
  end

  def test_it_can_update_a_task
    data = {:title => "learn sinatra",
            :description => "seriously."}

    TaskManager.create(data)
    task = TaskManager.find(1)

    assert_equal "learn sinatra", task.title
    assert_equal "seriously.", task.description
    assert_equal 1, task.id

    data = {:title => "learn ruby",
            :description => "seriously."}
    TaskManager.update(1, data)
    task = TaskManager.find(1)

    assert_equal "learn ruby", task.title
    assert_equal "seriously.", task.description
    assert_equal 1, task.id
  end

  def test_it_can_delete_a_task
    create_tasks(3)
    assert_equal 3, TaskManager.all.count

    TaskManager.delete(1)
    assert_equal 2, TaskManager.all.count
  end
end
