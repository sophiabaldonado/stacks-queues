# A company has six hiring positions with more people wanting jobs than the number of available positions.
# The company managers decide in order to give more people an opportunity to make money; they will allow
# people to work in three-month intervals. The first six people on the waiting list will be hired in the
# order that they are on the waiting list.  The first six people will keep these positions for three months.
# At the end of three months, the manager will roll a dice to determine the number of people who will lose their
# jobs. The company will use the policy of last-hired-first-fired.  For example, if the dice roll is 3, the
# last 3 people hired will lose their jobs to the first 3 people on the waiting list. People losing their
# jobs will be placed on the back of the waiting list in the order that they are fired. This process will
# continue for every three-month interval.

# start with ten people in the waiting list
# fire and hire the same rando amount, so you always have 6 employees
# your dice only goes up to 6

require_relative 'Stack.rb'
require_relative 'Queue.rb'


class Job
  attr_reader :queue, :employees

  def initialize
    @queue = Queue.new
    @employees = Stack.new
    start(10, 6)
  end

  def reorg
    people = roll_die
    fire(people) unless @employees.empty?
    hire(people)
    people
  end

  def status
    puts "Queue: #{@queue.inspect}"
    puts "Stack: #{@employees.inspect}"
  end

  private
  def start(in_line, starting_hire)
    i = 1
    in_line.times do
      @queue.enqueue("person_#{i}")
      i += 1
    end
    hire(starting_hire)
  end

  def roll_die
    rand(1..6)
  end

  def fire(number_of_people)
    number_of_people.times do
      @queue.enqueue(@employees.pop)
    end
  end

  def hire(number_of_people)
    number_of_people.times do
      @employees.push(@queue.dequeue)
    end
  end

end
