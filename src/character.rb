class Character

  def initialize
    @health = 1000
    @level = 1
  end

  def health
    @health
  end

  def level
    @level
  end

  def level=(lvl)
    @level = lvl
  end

  def alive?
    @health > 0
  end

  def damage(amount, attacker)
    return if attacker == self

    if self.level >= attacker.level + 5
      @health -= amount / 2
    else
      @health -= amount
      @health -= amount / 2 if attacker.level >= self.level + 5
    end
  end

  def heal(amount)
    return if !alive?

    @health += amount
    @health = 1000 if @health > 1000
  end
end
