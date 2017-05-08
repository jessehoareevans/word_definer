require('rspec')
require("word")
require('definition')

describe(Word) do

  before do
    Word.clear()
  end

  describe("#learn") do
    it("returns the word back that was inputted") do
      test_word = Word.new({:learn=> "fireplace"})
      expect(test_word.learn()).to(eq("fireplace"))
    end
  end

describe(".all") do
   it("shows what is inside the array") do
     expect(Word.all()).to(eq([]))
   end
 end

 describe(".clear") do
   it("clears the array") do
     expect(Word.all()).to(eq([]))
   end
 end

 describe("#save") do
   it("saves the word to the array") do
     word_test = Word.new({:learn=> "pillow"})
     word_test.save()
     word2_test = Word.new({:learn=> "green"})
     word2_test.save()
     expect(Word.all()).to(eq([word_test, word2_test]))
   end
 end

 describe("#id") do
    it("returns an id number of the word") do
      word_test = Word.new({:learn=> "pillow"})
      word_test.save()
      word2_test = Word.new({:learn=> "green"})
      word2_test.save()
      expect(word_test.id()).to(eq(1))
      expect(word2_test.id()).to(eq(2))
    end
  end

  describe(".find") do
   it('finds word based on its id number') do
     word_test = Word.new({:learn=> "pillow"})
     word_test.save()
     expect(Word.find(word_test.id())).to(eq(word_test))
   end
 end
end
