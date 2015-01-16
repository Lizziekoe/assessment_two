require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/contact_test')
require('./lib/phone')

 get('/') do
   @all_contacts = Contact.all()
   erb(:index)
 end
