class Origami < ApplicationRecord
    has_many :baskets
    has_many :basket_users, through: :baskets, class_name: "User"

    has_many :posts
    has_many :post_users, through: :posts, class_name: "User"
end
