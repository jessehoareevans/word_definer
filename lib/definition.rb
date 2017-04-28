class Definition

attr_accessor(:explanation)
@@definitions = []

  def initialize(attributes)
    @explanation = attributes.fetch(:explanation)
    @id = @@definitions.length + 1
  end

  define_method (:explanation) do
    @explanation
  end

  def self.all
    @@definitions
  end

  def save
    @@definitions.push(self)
  end

  def id
    @id
  end

  def self.clear
    @@definitions = []
  end
end
