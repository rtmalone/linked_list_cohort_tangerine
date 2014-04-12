class LinkedListItem
  attr_accessor :next_list_item
  attr_accessor :payload
  include Comparable

  #called by LinkedListItem.new
  def initialize(payload)
    @payload = payload
  end

  def next_list_item=(x)
    if self === x
      raise ArgumentError
    else
      @next_list_item = x
    end
  end

  def last?
    @next_list_item.nil?
  end

  def <=> object
    @payload.is_a?(Symbol) && !object.payload.is_a?(Symbol)
    @payload.is_a?(Symbol) && object.payload.is_a?(Symbol)
    @payload.to_s <=> object.payload.to_s
  end

  def === object
    self.object_id == object.object_id
  end
end
