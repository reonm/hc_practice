class Group_split
  attr_accessor :arr

  def initialize(arr)
    self.arr = arr
  end

  def show_first_group
    @first_group = arr.shuffle.slice(0, rand(2..4)).sort
  end

  def show_second_group
    arr - @first_group
  end

  def show_result
    p show_first_group
    p show_second_group
  end
end

arr = %w[A B c D E F]
split = Group_split.new(arr)
split.show_result
