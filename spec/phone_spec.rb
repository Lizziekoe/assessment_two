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

  describe("#save") do
    it("saves the phone number to the array of phone numbers") do
      test_number = Phone.new({:number => 5037998459})
      test_number.save()
      expect(Phone.all()).to(eq([test_number]))
    end
  end

  describe(".clear") do
    it('empties out all of the saved phone numbers') do
      test_number = Phone.new({:number => 5037998459})
      Phone.clear()
      expect(Phone.all()).to(eq([]))
    end
  end

  describe('.find') do
    it("returns a phone number by its id number") do
      test_number = Phone.new({:number => 5037998459})
      test_number.save()
      test_album_two = Phone.new({:number => 5033333333})
      test_album_two.save()
      expect(Phone.find(test_number.id())).to(eq(test_number))
    end
  end
end