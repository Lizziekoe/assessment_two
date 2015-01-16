require('rspec')
require('contact_test')

describe(Contact) do
  before() do
    Contact.clear()
  end

  describe('#name') do
    it('returns the name of the contact') do
      test_contact = Contact.new({:name => "lizzie"})
      expect(test_contact.name()).to(eq("lizzie"))
    end
  end

  describe('#id') do
    it('returns the id of the contact') do
      test_contact = Contact.new({:name => "lizzie"})
      expect(test_contact.id()).to(eq(1))
    end
  end

  describe('#save') do
    it('saves the contact name to the array of saved contact names') do
      test_contact = Contact.new({:name => "lizzie"})
      test_contact.save()
      expect(Contact.all()).to(eq([test_contact]))
    end
  end

  describe('.all') do
    it('is empty before putting an contact in') do
      expect(Contact.all()).to(eq([]))
    end
  end

  describe('.clear') do
    it('empties out all of the saved contacts') do
      Contact.new({:name => "lizzie"}).save()
      Contact.clear()
      expect(Contact.all()).to(eq([]))
    end
  end

  describe('.find') do
    it('returns an contact by their id number') do
      test_contact = Contact.new({:name => "lizzie"})
      test_contact.save()
      test_contact2 = Contact.new({:name => "julia"})
      test_contact2.save()
      expect(Contact.find(test_contact.id())).to(eq(test_contact))
    end
  end
end
