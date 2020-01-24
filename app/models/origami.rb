class Origami < ApplicationRecord
    has_many :baskets
    has_many :basket_users, through: :baskets, source: :user

    has_many :posts
    has_many :post_users, through: :posts, source: :user


    def self.search(params)
        Origami.where(params)
    end
end
