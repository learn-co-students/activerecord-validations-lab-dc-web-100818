class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
  validate :check_title

  CLICKBAIT = ["Won't Believe", "Secret", "Top", "Guess"]

  def check_title
    if !title.nil? && CLICKBAIT.none? do |tit|
          title.include?(tit)
        end
        errors.add(:title, "Need a better title")
    end
  end

end
