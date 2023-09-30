class User
    attr_accessor :name, :email

    def initialize( attributes = {})
        @name = attributes[:name]
        @email = attributes[:email]
    end

    def formatted_string
        "Name: #{@name}  <Email: #{@email}>"
    end
end

class Cuser
    attr_accessor :name, :email

    def initialize(name ="", email="")
        @name = name
        @email = email
    end

    def formatted_string
        "Name: #{@name}  <Email: #{@email}>"
    end
end
