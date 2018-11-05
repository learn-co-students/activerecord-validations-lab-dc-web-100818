class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 100 }
  validates :summary, length: { maximum: 100 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  validate :is_clickbait

  

  def is_clickbait
    clickbait = [/Won't Believe/i, /Secret/i, /Top [0-9]*/i, /Guess/i ]
    clickbait.each do |phrase|
      if phrase.match(title)
        return
      end
    end
    errors.add(:title, "is clickbait")
  end
end
 