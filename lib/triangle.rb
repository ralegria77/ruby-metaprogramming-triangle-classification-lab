class Triangle
  attr_accessor :s1, :s2, :s3, :kind

  def initialize(s1, s2, s3)
    @s1 = s1
    @s2 = s2
    @s3 = s3
  end

  def kind
    real_triangle
    if s1 == s2 && s1 == s3
      self.kind = :equilateral 
    elsif s1 == s2 || s1 == s3 || s2 == s3
      self.kind = :isosceles
    else
      self.kind = :scalene
    end
  end

  def real_triangle
    triangle = [(s1 + s2 > s3), (s1 + s3 > s2), (s2 + s3 > s1)]
    [s1, s2, s3].each {|s| triangle << false if s <= 0}
    raise TriangleError if triangle.include?(false)
  end





    # if (s1 * s2 * s3) == 0 || (s1 + s2) <= s3 || (s2 + s3) <= s1 || (s3 +s1) <= s2

    # elsif s1 == s2 && s1 == s3
    #   self.kind = :equilateral 

    # elsif s1 == s2 || s1 == s3 || s2 == s3
    #   self.kind = :isosceles

    # else
    #   self.kind = :scalene
    # end
    

  class TriangleError < StandardError
    def message
      puts "Not a triangle!"
    end
  end

end

