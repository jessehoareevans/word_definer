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

get('/word/:id') do
  word_id = params.fetch('id').to_i()
  @word = Word.find(word_id)
  @definitions = @word.definition
  erb(:word)
end

post('/word_form') do
  word = params.fetch('learn')
  Word.new(word).save()
  @word = Word.all()
  erb(:index)
end
