class LRUCache
    def initialize(size)
      @cache = []
      @size = size
    end

    def count
      # returns number of elements currently in cache
      @cache.length
    end

    def add(el)
      # adds element to cache according to LRU principle
      if @cache.include?(el)
        @cache.insert(-1, @cache.delete_at(@cache.index(el)))
      elsif @cache.length < @size
        @cache << el
      else
        @cache.shift
        @cache << el
      end
    end

    def show
      # shows the items in the cache, with the LRU item first
      p @cache.join(", ")
      nil
    end

    private
    # helper methods go here!

  end
