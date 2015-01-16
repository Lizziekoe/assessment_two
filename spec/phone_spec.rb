require('rspec')
require('phone')

describe(Phone) do
  before() do
    Phone.clear()
  end

  describe('#number') do
    it('returns the phone number') do
      test_number = Phone.new({:number => 5037998459})
      expect(test_number.number()).to(eq(5037998459))
    end
  end

  describe(".all") do
    it("is empty before putting phone number in") do
      expect(Phone.all()).to(eq([]))
    end
  end


end