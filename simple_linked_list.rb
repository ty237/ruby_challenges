# frozen_string_literal: true

class SimpleLinkedList
  def initialize(array = [])
    @array = array
  end

  def self.from_a(array)
    return SimpleLinkedList.new if array.nil?

    SimpleLinkedList.new(array)
  end

  def push(element)
    @array.push(element)
  end

  def head
    Element.new(@array.first, @array)
  end

  def reverse
    SimpleLinkedList.new(@array.reverse)
  end

  def pop
    @array.pop
  end

  def size
    @array.size
  end

  def empty?
    @array.empty?
  end

  def peek
    @array.last
  end

  def to_a
    @array
  end
end

class Element
  attr_accessor :datum, :next

  def initialize(datum, next_ = nil)
    @datum = datum
    @next = next_
  end

  def tail?
    @next.nil?
  end

  def ==(other_element)
    datum == other_element.datum
  end
end

l = SimpleLinkedList.from_a([1, 2])
p  l.size # 2 ==
p  l.peek # 1 ==
p  l.head.next.datum # 2 ==
