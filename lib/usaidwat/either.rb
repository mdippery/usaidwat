module USaidWat
  class Either
    attr_reader :value

    def initialize(value)
      @value = value
    end

    def >>(&block)
      raise NoMethodError, 'subclasses must define >>'
    end

    def left?
      false
    end

    def right?
      false
    end
  end

  class Left < Either
    def >>(callable)
      self
    end

    def left?
      true
    end
  end

  class Right < Either
    def >>(callable)
      callable.call(self)
    end

    def right?
      true
    end
  end
end
