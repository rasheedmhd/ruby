class User < ApplicationRecord
    validates :name, presence: true, length: { maximum: 50 }
    # VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    # Disallowing double dots
    #
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }
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
end
