class Customer < ActiveRecord::Base
    has_many :reviews
    has_many :restaurants, through: :reviews


    def full_name
        "#{first_name} #{last_name}"
    end

    def favorite_restaurant
        fav = reviews.order(star_rating: :desc).first
        fav.restaurant
    end

    def add_review(restaurant, rating)
        Review.create(restaurant: restaurant, star_rating: rating, customer: self)
    end

    def delete_reviews(restaurant)
        reviews.where(restaurant: restaurant).destroy_all
    end


end