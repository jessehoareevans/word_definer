require('sinatra')
require('sinatra/reloader')
require('./lib/word')
require('./lib/definition')
require('pry')
also_reload('lib/**/*.rb')

get('/') do
  @all_words = Word.all()
  erb(:index)
end

get('/new_word') do
  erb(:word_form)
end
