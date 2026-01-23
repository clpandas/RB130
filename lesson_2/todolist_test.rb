require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

require_relative 'todolist'

class TodoListTest < Minitest::Test

  def setup
    @todo1 = Todo.new("Buy milk")
    @todo2 = Todo.new("Clean room")
    @todo3 = Todo.new("Go to gym")
    @todos = [@todo1, @todo2, @todo3]

    @list = TodoList.new("Today's Todos")
    @list.add(@todo1)
    @list.add(@todo2)
    @list.add(@todo3)
  end

  def test_to_a
    assert_equal(@todos, @list.to_a)
  end

  def test_size
    assert_equal(3, @list.size)
  end

  def test_first
    assert_equal(@todo1, @list.first)
  end

  def test_last
    assert_equal(@todo3, @list.last)
  end

  def test_shift
    todo = @list.shift
    assert_equal(@todo1, todo)
    assert_equal([@todo2, @todo3], @list.to_a)
  end

  def test_pop
    todo = @list.pop
    assert_equal(@todo3, todo)
    assert_equal([@todo1, @todo2], @list.to_a)
  end

  def test_done?
    assert_equal(false, @list.done?)
  end

  def test_add_raise_error
    assert_raises(TypeError) { @list.add(1) }
    assert_raises(TypeError) { @list.add('hi') }
    assert_raises(TypeError) { @list.add(3.14) }
    assert_raises(TypeError) { @list.add([1, 2, 3]) }
    assert_raises(TypeError) { @list.add({:a => 1, :b => 2}) }
  end

  def test_shovel
    new_todo = Todo.new("Walk the dog")
    @list << new_todo
    @todos << new_todo

    assert_equal(@todos, @list.to_a)
  end

  def test_add_alias
    new_todo = Todo.new("Feed the cat") # using a fresh example is better practice
    @list.add(new_todo)
    @todos << new_todo

    assert_equal(@todos, @list.to_a)
  end

  def test_item_at_returns_correct_item
    assert_equal(@todo1, @list.item_at(0))
    assert_equal(@todo2, @list.item_at(1))
  end

  def test_item_at_raises_error_for_invalid_index      
    assert_raises(IndexError) { @list.item_at(5) }
  end

  def test_mark_done_at_returns_correct_boolean
    assert_equal(false, @todo1.done?)
    @list.mark_done_at(1)
    assert_equal(true, @todo2.done?)
    assert_equal(false, @todo3.done?)
  end

  def test_mark_done_at_raises_error_for_invalid_index
    assert_raises(IndexError) { @list.mark_done_at(5) }
  end

  def test_mark_undone_at_returns_correct_boolean
    @list.done!
    assert_equal(true, @todo1.done?)
    @list.mark_undone_at(1)
    assert_equal(false, @todo2.done?)
    assert_equal(true, @todo3.done?)
  end

  def test_mark_undone_at_raises_error_for_invalid_index
    assert_raises(IndexError) { @list.mark_undone_at(5) }
  end

  def test_done_bang
    @list.done!
    assert_equal(true, @todo1.done?)
    assert_equal(true, @todo2.done?)
    assert_equal(true, @todo3.done?)
    assert_equal(true, @list.done?)
  end

  def test_remove_at_deletes_and_returns_correct_todo_item
    removed_todo = @list.remove_at(0)
    assert_equal(@todo1, removed_todo)
    assert_equal([@todo2, @todo3], @list.to_a)
  end

  def test_remove_at_raises_error_for_invalid_index
    assert_raises(IndexError) { @list.remove_at(5) }
  end

  def test_to_s
    output = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [ ] Buy milk
    [ ] Clean room
    [ ] Go to gym
    OUTPUT

    assert_equal(output, @list.to_s)
  end

  def test_to_s_for_done_item
    output = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [ ] Buy milk
    [X] Clean room
    [ ] Go to gym
    OUTPUT

    @list.mark_done_at(1)
    assert_equal(output, @list.to_s)
  end

  def test_to_s_for_all_done_items
    output = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [X] Buy milk
    [X] Clean room
    [X] Go to gym
    OUTPUT

    @list.done!
    assert_equal(output, @list.to_s)
  end

  def test_each_iterates
    result = []
    @list.each { |todo| result << todo }
    assert_equal([@todo1, @todo2, @todo3], result)
  end

  def test_each_returns_original_list
    original_list = @list.each { |todo| nil }
    assert_equal(@list, original_list)
  end

  def test_select
    @todo2.done!
    list = @list.select { |todo| todo.done? }

    assert_equal(1, list.size)
    assert_equal(@todo2, list.first)
  end

  def test_select_returns_a_new_todolist_object
    list = @list.select { |todo| nil }

    refute_same(@list, list)
  end
end