class Contact
  attr_reader(:name, :id, :digits)
  @@all_contacts = []

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @digits = []
    @id = @@all_contacts.length().+(1)
  end

  define_method(:save) do
    @@all_contacts.push(self)
  end

  define_singleton_method(:all) do
    @@all_contacts
  end

  define_singleton_method(:clear) do
    @@all_contacts = []
  end

  define_singleton_method(:find) do |identification|
    @@all_contacts.each() do |contact|
      if contact.id().eql?(identification)
        return contact
      end
    end
  end

  define_method(:add_number) do |number|
    @digits.push(number)
  end

  # define_method(:delete_contact) do |ids|
  #   ids.each() do |id|
  #     @all_contacts.each() do |contact|
  #     if contactname.id() == id
  #     @all_contacts.delete(contact)
  #     end
  #   end
  # end
# end
end
