class User < ApplicationRecord
    has_many :baskets
    has_many :basket_origamis, through: :baskets, source: :origami

    has_many :posts
    has_many :post_origamis, through: :posts, source: :origami
   
    validates :username, :password, :name, :bio, presence: true

    validates :username, uniqueness: true

end
