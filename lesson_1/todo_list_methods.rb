class Todo
  DONE_MARKER = 'X'
  UNDONE_MARKER = ' '

  attr_accessor :title, :description, :done

  def initialize(title, description='')
    @title = title
    @description = description
    @done = false
  end

  def done!
    self.done = true
  end

  def done?
    done
  end

  def undone!
    self.done = false
  end

  def to_s
    "[#{done? ? DONE_MARKER : UNDONE_MARKER}] #{title}"
  end

  def ==(otherTodo)
    title == otherTodo.title &&
      description == otherTodo.description &&
      done == otherTodo.done
  end
end

class TodoList
  attr_accessor :title

  def initialize(title)
    @title = title
    @todos = []
  end

  def add(todo)
    raise TypeError, "Can only add Todo objects" unless todo.is_a?(Todo) 

    @todos << todo
  end
  alias_method :<<, :add

  # def <<(todo)
  #   add(todo)
  # end

  def size
    @todos.size
  end

  def first
    @todos.first
  end

  def last
    @todos.last
  end

  def to_a
    @todos.clone
  end

  def done?
    @todos.all? { |todo| todo.done? }
  end

  def item_at(idx)
    @todos.fetch(idx)
  end

  def mark_done_at(idx)
    item_at(idx).done!
  end

  def mark_undone_at(idx)
    item_at(idx).undone!
  end

  def done!
    @todos.each { |todo| todo.done! }
  end

  def shift
    @todos.shift
  end

  def pop
    @todos.pop
  end

  def remove_at(idx)
    @todos.delete(item_at(idx))
  end

  def to_s
    todo_items = @todos.map { |todo| "#{todo}" }.join("\n")
    "---- #{title} ----\n#{todo_items}"
  end

  def each
    @todos.each { |todo| yield(todo) }
    self
  end

  def select
    new_list = TodoList.new(title)
    each { |todo| new_list.add(todo) if yield(todo) }
    new_list
  end

  # added methods:
  def find_by_title(title)
    select { |todo| todo.title == title }.first
  end

  def all_done
    new_list = TodoList.new(title)
    each { |todo| new_list.add(todo) if todo.done? }
    new_list

    # LS solution (I like this better)
    # select { |todo| todo.done? }
  end

  # inspired by LS solution
  def all_not_done
    select { |todo| !todo.done? }
  end

  def mark_done(title)
    # todo = find_by_title(title)
    # todo.done! if todo

    # LS solution
    # find_by_title(title) && find_by_title(title).done!

    # one-liner solution using the safe navigation operator
    find_by_title(title)&.done!
  end

  def mark_all_done
    each { |todo| todo.done! }
  end

  def mark_all_undone
    each { |todo| todo.undone! }
  end
end