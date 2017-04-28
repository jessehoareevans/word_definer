class Word

attr_accessor(:learn)
@@words = []

  def initialize(attributes)
    @learn = attributes.fetch(:learn)
    @id = @@words.length + 1
  end

  define_method (:learn) do
    @learn
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
end
