class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction), message: "%{value} is not a valid option"}
  validate :clickbaity

  @@clickbait = [/Won't Believe/i, /Secret/i, /Top/i, /Guess/i]

  def clickbaity
    if @@clickbait.none? {|c| c.match title}
      errors.add(:title, "Title need more clickbait")
    end
  end


#regular validations
end
