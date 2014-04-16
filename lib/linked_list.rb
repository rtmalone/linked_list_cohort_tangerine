require 'linked_list_item'

class LinkedList
  attr_reader :size

  def initialize(*args)
    @size = 0
    args.each do |arg|
      add_item(arg)
    end
  end

  def add_item(payload)
    lli = LinkedListItem.new(payload)
    if @first_item.nil?
      @first_item = lli
    else
      item = @first_item
      until item.last?
        item = item.next_list_item
      end
      item.next_list_item = lli
    end
    @size += 1
  end

  def get(i)
    get_item(i).payload
  end

  def last
    if size == 0
      nil
    else
      get(size - 1)
    end
  end

  def to_s
    result = "|"
    item = @first_item
    until item.nil?
      result << " " + item.payload.to_s
      result << "," unless item.last?
      item = item.next_list_item
    end
    result + " |"
  end

=begin
=> this can be used instead of [] method:
  alias [] get
=end

  def [](index)
    get(index)
  end
=begin
  def []= (index, value)
    current_item = @first_item
    if index == 0
      current_item.payload = value
    else
      index.times do
        current_item = current_item.next_list_item
      end
      current_item.payload = value
    end
  end
=end

  def []= (index, value)
    get_item(index).payload = value
  end

  def remove index
    item = @first_item

    #error if trying to delete negative num, or greater than length of list
    raise IndexError if (index < 0) or (index >= @size)

    if index != 0
      (index-1).times {item = item.next_list_item}
      item.next_list_item = item.next_list_item.next_list_item
    else
    #removing first item in list
      item = item.next_list_item
      @first_item = item
    end

    @size -= 1
  end

  def indexOf string
    return nil unless @size > 0
    index = 0
    item = @first_item

    until item.payload == string
      item = item.next_list_item
      index += 1

      if index == @size
        index = nil
        break
      end
    end

    return index
  end

  def sorted?
    item = @first_item
    until item.nil? or item.last?
      return false if item > item.next_list_item
      item = item.next_list_item
    end
    true
  end

  def sort
    return "| |" if @first_item.nil?
    item = @first_item
    self.to_s
  end

  private

  def get_item(i)
    raise IndexError if i < 0 or i >= size
    item = @first_item
    i.times do
      item = item.next_list_item
    end
    item
  end
end
