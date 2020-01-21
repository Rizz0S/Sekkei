class User < ApplicationRecord
    has_many :baskets
    has_many :basket_origamis, through: :baskets, class_name: "Origami"

    has_many :posts
    has_many :post_origamis, through: :posts, class_name: "Origami"
end
