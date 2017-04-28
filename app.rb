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
  @word = Word.new({:learn => learn})
  @word.save()
  @word = Word.all()
  @definitions = Definition.all()
  erb(:index)
end

get('/word/:id/definitions/new') do
  word_id = params.fetch('id').to_i()
  @word = Word.find(word_id)
  erb(:definition_form)
end

post('/definition_form') do
  explanation = params.fetch('explanation')
  @definitions = Definition.new({:explanation=> explanation})
  @definitions.save()
  @definitions = Definition.all()
  @word = Word.all()
end
