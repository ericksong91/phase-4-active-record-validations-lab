

class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: {in: ["Fiction", "Non-Fiction"]}
    validate :clickbait?

    # pattern = [/Won't Believe/i, /True Facts/i]

    # def clickbait?
    #     if pattern.none? {|p| p.match title}
    #         errors.add(:title, "Cannot be clickbait")
    #     end
    # end


    CLICKBAIT_PATTERNS = [
        /Won't Believe/i
      ]
    
      def clickbait?
        byebug
        if CLICKBAIT_PATTERNS.none? { |pat| pat.match title }
          errors.add(:title, "must be clickbait")
        end
      end

end
