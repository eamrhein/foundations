class Dog
  def initialize(name, breed, age, bark, favorite_foods)
    @name = name
    @breed = breed
    @age = age
    @bark = bark
    @favorite_foods = favorite_foods
  end
  def name
    @name
  end
  def breed
    @breed
  end
  def age
    @age
  end
  def age=(num)
    @age = num
  end
  def bark
    if self.age > 3
      return @bark.upcase
    end
    if self.age <= 3
      return @bark.downcase
    end
  end
  def favorite_foods
    @favorite_foods
  end
  def favorite_food?(str)
    sanitized_food = self.favorite_foods.map {|i| i.downcase}
    sanitized_food.include?(str.downcase)
  end
end
