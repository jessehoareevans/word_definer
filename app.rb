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
  learn = params.fetch('name')
  Word.new({:learn => learn}).save()
  @words = Word.all()
  erb(:success)
end

get('/words/:id') do
  @word = Word.find(params.fetch('id').to_i())
  erb(:word_definition)
end

get('/definition/:id')
  @definition = Definition.find(params.fetch('id').to_i())
  erb(:definition)
end

get('/definition_form') do
  erb(:definition_form)
end

post('/new') do
  definition= params.fetch('definition')
  @definition = Definition.new(definition)
  @definition.save()
  @word.add_definition(@definition)
  erb(:word_definition)
end
