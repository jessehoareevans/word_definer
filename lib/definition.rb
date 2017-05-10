class Definition

attr_reader(:explanation, :id)
@@definitions = []

  def initialize(attributes)
    @explanation = explanation
    @id = @@definitions.length + 1
    @explain = []
  end

  define_method (:add_definition) do |definition|
    @explain.push(definition)
  end

  def self.all
    @@definitions
  end

  def save
    @@definitions.push(self)
  end

  def self.clear
    @@definitions = []
  end

  def explain
    @explain
  end

  def self.find(id_number)
    found_definition = nil
    @@definitions.each() do |word|
      if word.id() == id_number.to_i()
        found_definition = definition
      end
    end
    found_definition
  end
end
