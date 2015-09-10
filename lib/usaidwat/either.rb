module USaidWat
  class Either
    attr_reader :value

    def initialize(value)
      @value = value
    end
  end

  class Left < Either
    def method_missing(method_sym, *args, &block)
      self
    end
  end

  class Right < Either
    def method_missing(method_sym, *args, &block)
      @value = value.send(method_sym, *args, &block)
      self
    end
  end
end
