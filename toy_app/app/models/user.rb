class User < ApplicationRecord
    has_many :micropost
    validates :name, :email, presence: true
end
