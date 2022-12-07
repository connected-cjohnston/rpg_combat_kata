class Character

  def initialize
    @health = 1000
  end

  def health
    @health
  end

  def level
    1
  end

  def alive?
    @health > 0
  end

  def damage(amount)
    @health -= amount
  end

  def heal(amount)
    return if @health <= 0

    @health += amount
    @health = 1000 if @health > 1000
  end
end
