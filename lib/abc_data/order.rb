module AbcData
  module_function
  def order(object)
    Abc.new.order(object)
  end

  class Abc
    def order(object)
      case object
        when Array
          object = orderArray(object)
        when FalseClass
          # OK
        when Fixnum
          # OK
        when Float
          # OK
        when Hash
          object = orderHash(object)
        when NilClass
          # OK
        when String
          # OK
        when TrueClass
          # OK
        else raise "Unsupported type: '#{object}' is a(n) '#{object.class}'"
      end
      return object
    end

    def orderArray(array)
      ret = []
      array.sort_by{ |x| order(x).to_s }.map do |item|
        ret.push(order(item))
      end
      return ret
    end

    def orderHash(hash)
      ret = {}
      hash.sort.map do |key, value|
        ret[key] = order(value)
      end
      return ret
    end
  end
end
