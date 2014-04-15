class LinkedListItem
  attr_accessor :next_list_item
  attr_accessor :payload
  include Comparable

  #called by LinkedListItem.new
  def initialize(payload)
    @payload = payload
  end

  def next_list_item=(item)
    # 'self' should always be to left; 'self' can't be redefined
    # can refactor to:
      # raise ArgumentError it self = item
      # @next_list_item = item
    if self === item
      raise ArgumentError
    else
      @next_list_item = item
    end
  end

  def last?
    @next_list_item.nil?
  end

  def <=>(other_item)
    payload1 = self.payload
    payload2 = other_item.payload

    precedence = [Fixnum, String, Symbol]
    index1 = precedence.index(payload1.class)
    index2 = precedence.index(payload2.class)
    class_equality = (index1 <=> index2)

    if class_equality == 0
      payload1 <=> payload2
    else
      class_equality
    end
  end

  def ===(other_item)
    self.object_id == other_item.object_id
  end
end
