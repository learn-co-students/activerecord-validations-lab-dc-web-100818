class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 10}
  validates :summary, length: {maximum: 40}
  validates :category, inclusion: {in: %w(Fiction)}
  validate :is_clickbait?

  @@clickbait = [
    "Won't Believe",
  ]

  def is_clickbait?
    if self.title.present?
      if !self.title.include?(@@clickbait[0])
        errors.add(:title, "must be clickbait.")
      end
    end
  end

end
