class User < ApplicationRecord
    before_save { email.downcase! }
    # before_save { self.email = email.downcase }
    # The above is the same as this but inside the model,
    # in this case User, the self. on the right side is optional
    # before_save { self.email = email.downcase }
    validates :name, presence: true, length: { maximum: 50 }
    # VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    # Disallowing double dots
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }, uniqueness: true
    validates :password, presence: true, length: { minimum: 6}
    # uniqueness: { case_sensitive: false },
    # validates is a method so
    # validates(:name, presence: true) is the same
    # with the added length validations, validates now becomes
    # validates(\
    #   :name, presence: true,
    #   length: {
    #       maximum: 50
    #   }
    # )
    # a method that takes, a symbol, a hash with a single value, and another
    has_secure_password
end
