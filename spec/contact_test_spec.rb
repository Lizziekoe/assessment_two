require('rspec')
require('contact_test')
require('phone')

describe ('Contact') do
    before() do
    Contact.clear()
  end

  describe("#name") do
    it("will return the name of the contact") do
      test_contact = Contact.new({:name => "lizzie"})
      expect(test_contact.name()).to(eq("lizzie"))
    end
  end

  describe("#save") do
    it("saves another name to the array of saved names") do
      test_contact = Contact.new({:name => "lizzie"})
      test_contact.save()
    expect(Contact.all()).to(eq([test_contact]))
    end
  end

  describe(".all") do
    it("is empty before entering first contact") do
      expect(Contact.all()).to(eq([]))
    end
  end

  describe(".clear") do
    it("clears the array") do
      Contact.new({:name => "lizzie"}).save()
      Contact.clear()
      expect(Contact.all()).to(eq([]))
    end
  end
end


