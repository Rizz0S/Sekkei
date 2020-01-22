class Post < ApplicationRecord
    belongs_to :user
    belongs_to :post_origami, class_name: "Origami"
end
