class Phone
  attr_reader(:number, :id)
  @@all_numbers = []

  define_method(:initialize) do |attributes|
    @number = attributes.fetch(:number)
    @id = @@all_numbers.length().+(1)
  end

  define_singleton_method(:all) do
    @@all_numbers
  end

  define_method(:save) do
    @@all_numbers.push(self)
  end

  define_singleton_method(:clear) do
    @@all_numbers = []
  end

  define_singleton_method(:find) do |identification|
    @@all_numbers.each() do |number|
      if number.id().eql?(identification)
        return number
      end
    end
  end
end