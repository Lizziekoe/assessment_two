require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/contact_test')
require('./lib/phone')

 get('/') do
  @all_contacts = Contact.all()
  erb(:index)
end

post('/contacts') do
  @name = params.fetch('contact')
  Contact.new({:name => @name}).save()
  @all_contacts = Contact.all()
  erb(:index)
end

get('/contacts/:id') do
  @all_contacts = Contact.find(params.fetch('id').to_i())
  @all_numbers = Phone.all()
  erb(:contacts)
end

post('/numbers') do
  @number = params.fetch('number')
  @all_numbers = Phone.new({:number => @number}).save()
  @all_contacts = Contact.find(params.fetch('contact_id').to_i())
  @all_contacts.add_number(@number)
  @all_numbers = Phone.all()
  erb(:contacts)
end
