class Contact

	@@all_contacts = []

	attr_reader(:name)

	define_method(:initialize) do |attributes|
		@name = attributes.fetch(:name)	
	end
  
  define_singleton_method(:all) do
    @@all_contacts
  end

	define_method(:save) do
		@@all_contacts.push(self)
	end

	define_singleton_method(:clear) do
		@@all_contacts = []
	end

end