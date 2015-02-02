module RandomGenerator
  extend ActiveSupport::Concern

  def generateRandomSequence
    return Array.new(6) { [*"A".."Z", *"a".."z", *"0".."9"].sample }.join.to_s
  end
end