class Contact
  attr_reader(:name, :id)
  @@all_contacts = []

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    # @wrote = []
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
end
