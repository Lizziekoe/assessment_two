require('rspec')
require('contact_test')

describe ('Contact') do
    before() do
    Contact.clear()
  end

  describe(".clear") do
    it("clears the array") do
      Contact.new({:name => "lizzie", :number => 5037998459}).save()
      Contact.clear()
      expect(Contact.all()).to(eq([]))
    end
  end

  describe(".all") do
    it("is empty at first") do
      expect(Contact.all()).to(eq([]))
    end
  end

  describe("#save") do
    it("saves another name and number to the phonebook") do
      test_contact = Contact.new({:name => "lizzie", :number => 5037998459})
      test_contact.save()
    expect(Contact.all()).to(eq([test_contact]))
    end
  end
end