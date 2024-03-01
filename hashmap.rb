require 'linkedlist'

class HashMap
  LOAD_FACTOR = 0.75
  def initialize(default_size=16)
    @buckets = Array.new(default_size)
    @capacity = default_size
    @filled_buckets = 0
    @number_of_keys = 0
  end

  def hash(key)
    hash_code = 0
    prime_number = 31
       
    key.each_char { |char| hash_code = prime_number * hash_code + char.ord }
       
    hash_code
  end

  def set(key,value)
    hash_code = hash(key)
    hash_index = hash_code % @capacity

    if buckets[hash_index].nil?
      list = LinkedList.new
      list.append(key,value)
      buckets[hash_index] = list.head
      @filled_buckets+=1
      @number_of_keys+=1
    else
      list = LinkedList(buckets[hash_index])
      list.append(key,value)
      @number_of_keys+=1
    end
  end

  def get(key)
    hash_index=hash_code(key)
    if buckets[hash_index]
      list = LinkedList(buckets[hash_index])
    else
      return nil
    end
    list.find(key)
  end

  def has(key)
    if get(key).nil?
      return false
    end
    true
  end

  def length
    @number_of_keys
  end
  
  def clear
    @buckets.clear
    @number_of_keys=0
    @filled_buckets=0
  end

  def remove(key)
    hash_index = hash_code(key)
    if has(key)
      list = LinkedList(buckets[hash_index])
      @number_of_keys-=1
      removed_value= list.remove(key)
      if @buckets[hash_index]==nil
        @filled_buckets-=1
      end
      return removed_value
    end
    nil
  end

end
