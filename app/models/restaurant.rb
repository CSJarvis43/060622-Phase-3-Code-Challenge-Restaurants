class Restaurant < ActiveRecord::Base
    has_many :reviews
    has_many :customers, through: :reviews


    def self.fanciest
        Restaurant.all.order(price: :desc).first
    end

    def all_reviews
        reviews.map(&:full_review)
    end



end