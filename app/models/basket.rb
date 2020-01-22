class Basket < ApplicationRecord
    belongs_to :user
    belongs_to :origami
    # belongs_to :basket_origami, class_name: "Origami"
end
