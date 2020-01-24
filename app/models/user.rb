class User < ApplicationRecord
    has_many :baskets
    has_many :basket_origamis, through: :baskets, source: :origami

    has_many :posts
    has_many :post_origamis, through: :posts, source: :origami
   
    validates :username, :name, :bio, presence: true

    validates :username, uniqueness: true

    has_secure_password

    def add_to_basket(origami)
        self.basket_origamis << origami
    end


    def delete_from_basket(origami)
        self.basket_origamis.delete(origami)
    end

    def get_reccommended_origami
        likeness_hash = {}
        in_basket = self.basket_origamis
        origamis_not_in_basket = Origami.all.reject{|origami| in_basket.include?(origami)}

        origamis_not_in_basket.each do |origami|
            likeness = 0;
            in_basket.each do |basket_origami|
                if (origami.category == basket_origami.category)
                    likeness += 1
                end 
                if (origami.style == basket_origami.style)
                    likeness += 1
                end 
                if (origami.difficulty == basket_origami.difficulty)
                    likeness += 1
                end
                likeness_hash[origami] = likeness
            end
        end
        likeness_hash.max_by{|origami, likeness| likeness}[0]

    end

end
