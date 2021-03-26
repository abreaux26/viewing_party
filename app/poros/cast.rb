class Cast
  attr_reader :name,
              :character

  def initialize(data)
    @name = data[:name]
    @character = data[:character]
  end
end
