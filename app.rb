require('sinatra')
require('sinatra/reloader')
require('./lib/word')
require('./lib/definition')
require('pry')
also_reload('lib/**/*.rb')

get('/') do
erb(:index)
end

get('/words/new') do
 erb(:words_form)
end

get('/words') do
  @words = Word.all()
  erb(:words)
end

post('/words') do
  name = params.fetch('name')
  @word = Word.new(name)
  @word.save()
  erb(:success)
end

get('/definitions/:id') do
  @definition = Definition.find(params.fetch('id').to_i())
  erb(:definition)
end

get('/words/:id') do
  word_id = params.fetch('id').to_i()
  @word = Word.find(word_id)
  erb(:word)
end

post('/definitions/') do
  definition = params.fetch('definition')
  @definition = Definition.new(definition)
  @definition.save()
  @word = Word.find(params.fetch('word_id').to_i())
  @word.add_definition(@definition)
  erb(:word)
end

get('/words/:id/definitions/new') do
  @word = Word.find(params.fetch('id').to_i())
  erb(:word_definition)
end

post('/new') do
  definition = params.fetch('definition')
  @definition = Definition.new(definition)
  @definition.save()
  @word = Word.find(params.fetch('word_id').to_i())
  @word.add_definition(@definition)
  erb(:success)
end



get('/definitions/') do
  @definitions = Definition.all()
  erb(:definitions)
end

get('/word_definition/new') do
  erb(:word_definition)
end
