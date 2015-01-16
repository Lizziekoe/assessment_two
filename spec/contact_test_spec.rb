require('rspec')
require('contact_test')
require('phone')

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

  describe("#add_number") do
    it("adds a new phone number to the contact class") do
      test_contact_name = Contact.new({:name => "lizzie"})
      test_contact_number = Phone.new({:number => 5033333333})
      test_contact_name.add_number(test_contact_number)
      expect(test_contact_name.digits()).to(eq([test_contact_number]))
    end
  end

  # describe("#delete_contact") do
  #   it("deletes a specified contact") do
  #     my_contact_one = Contact.new({:name=>"lizzie"}).save()
  #     my_contact_two = Contact.new({:name=>"julia"}).save()
  #     my_contacts = Contact.all()
  #     contact_to_delete = Contact.find({:name => "lizzie"})
  #     my_contacts.delete_contact(contact_to_delete)
  #     expect(my_contacts.all()).to(eq([test_contact]))
  #   end
  # end
end
