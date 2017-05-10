class Word

attr_reader(:learn, :id)
@@words = []

  def initialize(attributes)
    @learn = attributes.fetch(:learn)
    @id = @@words.length + 1
    @word = []
  end

  define_method (:learn) do
    @learn
  end

  define_method (:add_definition) do |definition|
    @word.push(definition)
  end

  def self.all
    @@words
  end

  def save
    @@words.push(self)
  end

  def id
    @id
  end

  def self.clear
    @@words = []
  end

  def word
    @word
  end

  def add_word(definition)
    @word.push(definition)
  end

  def self.find(id_number)
    found_word = nil
    @@words.each() do |word|
      if word.id() == id_number.to_i()
        found_word = word
      end
    end
    found_word
  end
end
