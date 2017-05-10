require('rspec')
require('definition')

describe(Definition) do

  before do
    Definition.clear()
  end

  describe("#definition") do
    it("returns the definition back that was inputted") do
      test_word = Definition.new("a place for a fire with a chimney")
      expect(test_word.definition()).to(eq("a place for a fire with a chimney"))
      end
  end

  describe(".all") do
    it("shows what is inside the array") do
     expect(Definition.all()).to(eq([]))
    end
   end

  describe(".clear") do
    it("clears the array") do
     expect(Definition.all()).to(eq([]))
    end
  end

  describe("#save") do
   it("saves the definition to the array") do
     definition_test = Definition.new({:explanation=> "object used to support someone's head"})
     definition_test.save()
     definition2_test = Definition.new({:explanation=> "colour between blue and yellow"})
     definition2_test.save()
     expect(Definition.all()).to(eq([definition_test, definition2_test]))
   end
 end

 describe("#id") do
    it("returns an id number of the word") do
      definition_test = Definition.new({:explanation=> "object used to support someone's head"})
      definition_test.save()
      definition2_test = Definition.new({:explanation=> "colour between blue and yellow"})
      definition2_test.save()
      expect(definition_test.id()).to(eq(1))
      expect(definition2_test.id()).to(eq(2))
    end
  end
end
