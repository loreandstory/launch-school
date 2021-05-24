class Person
  attr_writer :secret

  def share_secret
    puts secret
  end

  def compare_secret(other_person)
    secret == other_person.secret
  end

  protected

  attr_reader :secret
end

nariman = Person.new
nariman.secret = 'Shh...this is a secret!'

nathan = Person.new
nathan.secret = 'Shh...this is a different secret!'

puts nariman.compare_secret(nathan)
