class Post < ApplicationRecord
    belongs_to :user
    belongs_to :origami

    validates :title, :content, presence: true
end
